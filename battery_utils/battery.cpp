/*
 * Copyright (C) 2013 Ingenic Semiconductor Co., Ltd.
 * Authors: Duke Fong <duke@dukelec.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version
 * 3 of the License, or (at your option) any later version.
 */

#include <vector>
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <algorithm>
#include <iomanip>
#include <cmath>
#include <ctime>

#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

#define LOG_TAG  "battery_utils"
#include <cutils/log.h>

using namespace std;

// Format: status @time cap
#define BAT_DB "/data/system/battery.txt"
#define BAT_W "/proc/power_supply/capacity"
#define BAT_R "/sys/class/power_supply/battery/capacity"
#define BAT_S "/sys/class/power_supply/battery/status"
#define BAT_P "/proc/power_supply/status"
#define  LOGD(AAA, args...) do { ALOGD(AAA, ## args); printf(LOG_TAG ": " AAA "\n", ## args); } while (0)
#define  LOGE(AAA, args...) do { ALOGE(AAA, ## args); printf(LOG_TAG ": " AAA "\n", ## args); } while (0)
#define  LOGV(AAA, args...) do { ALOGV(AAA, ## args); printf(LOG_TAG ": " AAA "\n", ## args); } while (0)
#define  LOGI(AAA, args...) do { ALOGI(AAA, ## args); printf(LOG_TAG ": " AAA "\n", ## args); } while (0)
//#define  LOGV(...)   ALOGV(__VA_ARGS__)


// "%s, cap real: %d, cap show: %d, volt: %dmV, next %ds\n"

struct BAT {
	time_t time;
	string status;
	int cap_real;
	int cap_show;
	int volt;
	int next;
};

static void get_proc(string s, BAT &bat)
{
	string::size_type pos;

	if ((pos = s.find(",")) != string::npos) {
		bat.status = s.substr(0, pos);
	} else {
		LOGE("get_proc: can't find first \",\"");
		exit(-1);
	}

	if ((pos = s.find("cap real: ")) != string::npos) {
		stringstream ss(s.substr(pos + sizeof("cap real: ") - 1));
		ss >> bat.cap_real;
	} else {
		LOGE("get_proc: can't find first \"cap real\"");
		exit(-1);
	}

	if ((pos = s.find("cap show: ")) != string::npos) {
		stringstream ss(s.substr(pos + sizeof("cap show: ") - 1));
		ss >> bat.cap_show;
	} else {
		LOGE("get_proc: can't find first \"cap show\"");
		exit(-1);
	}

	if ((pos = s.find("volt: ")) != string::npos) {
		stringstream ss(s.substr(pos + sizeof("volt: ") - 1));
		ss >> bat.volt;
	} else {
		LOGE("get_proc: can't find first \"volt\"");
		exit(-1);
	}

	if ((pos = s.find("next: ")) != string::npos) {
		stringstream ss(s.substr(pos + sizeof("next: ") - 1));
		ss >> bat.next;
	} else {
		LOGE("get_proc: can't find first \"next\"");
		exit(-1);
	}

	LOGI("%s, %d, %d, %d, %d\n", bat.status.c_str(), bat.cap_real,
			bat.cap_show, bat.volt, bat.next);
}

static void store(void)
{
	LOGI("store...");
	ofstream outfile(BAT_DB);

	ifstream bat_p(BAT_P);
	std::string bat_p_str;
	std::getline(bat_p, bat_p_str);

	stringstream ss;
	ss << time(0);

	string out = ss.str() + "\n" + bat_p_str + "\n";

	outfile << out;
	LOGI("store = %s", out.c_str());
}

// charging -> charging
// charing -> discharging
// discharging -> charging
// discharging -> discharging

static bool daemon_seed()
{
	int childpid = 0;
	//pid_t pid = 0;
	if ((childpid = fork ()) < 0) { //check to see if we can get a child
		return false;
	}  else if (childpid > 0) { //if we have a child then parent can exit
		exit(0);
	}
	//Set our sid and continue normal runtime as a forked process
	setsid();
	umask(0); //Xxx set the unmask

	//close(_fileno(stderr)); //two ways of retrieving std fdes
	//close(_fileno(stdout));
	//close(STDIN_FILENO);

	return true;
}

static void set_capacity(int cap)
{
	stringstream ss;
	ss << cap;
	string s;
	s = "echo " + ss.str() + " > " BAT_W;
	LOGV("system() -> %s", s.c_str());
	system(s.c_str());
}

static void restore(void)
{
	LOGI("restore, sleep 5s...");
	daemon_seed();
	sleep(5);
	LOGI("restore...");

	BAT saved, current;
	time_t time_delta;

	{
		LOGI("get saved");
		ifstream bat_db(BAT_DB);
		bat_db >> saved.time;

		string s;
		getline(bat_db, s);
		getline(bat_db, s);
		LOGI("s->%s", s.c_str());
		get_proc(s, saved);
	}

	{
		LOGI("get current");
		current.time = time(0);
		ifstream bat_p(BAT_P);
		string s;
		getline(bat_p, s);
		LOGI("s->%s", s.c_str());
		get_proc(s, current);
	}

	time_delta = current.time - saved.time;
	LOGI("time saved = %ld", saved.time);
	LOGI("time now = %ld", current.time);
	LOGI("time delta = %ld", time_delta);

	if (time_delta <= 5)
		return;

/* Now change next line's "60*5" to "60*20",
 * because RTC's resistor was was wrong and make time varying fast.
 *
 * After modify RTC's resistor, need to change it back.
*/
	if (time_delta <= 60*20) {
		LOGI("time_delta < 60*5");
		set_capacity(saved.cap_show);
		return;
	}
#if 0
	//if (status != "Discharging")
	//	return;

	if (time_delta > 60*15)
		return;

	ifstream bat_r(BAT_R);
	bat_r >> cap_now;

	if (abs(cap_now - cap_saved) > 30) {
		cout << "abs > 30\n";
		return;
	}
#endif
}

static void help(void)
{
	cout << "Usage:\n";
	cout << "\t battery --store\n";
	cout << "\t battery --restore\n";
	LOGE("arg not allow");
}

int main(int argc, char *argv[])
{
	if (argc != 2) {
		help();
		return -1;
	}

	string s(argv[1]);

	if (s.find("--store") == 0)
		store();
	else if (s.find("--restore") == 0)
		restore();
	else {
		help();
		return -1;
	}
}
