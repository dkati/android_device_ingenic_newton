/*
 * Copyright (C) 2012 The Android Open Source Project
 *
 * Description : Extend the functionality of recovery
 *
 */

#include <stdio.h>
#include <string.h>

#include "edify/expr.h"

Value* IngenicawatchFn(const char* name, State* state, int argc, Expr* argv[])
{
    printf("-----------------------loading IngenicwatchFn-------------------------\n");

	return StringValue(strdup("result successful"));
}

void Register_librecovery_updater_watch()
{
	printf("installing ingenic watch updater extensions\n");

	RegisterFunction("ingenic_watch", IngenicwatchFn);
}
