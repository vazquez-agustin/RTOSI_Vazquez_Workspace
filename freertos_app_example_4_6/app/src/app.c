/*
 * Copyright (c) 2023 Juan Manuel Cruz <jcruz@fi.uba.ar>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @file   : app.c
 * @date   : Set 26, 2023
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 * @version	v1.0.0
 */

/********************** inclusions *******************************************/
/* Project includes. */
#include "main.h"
#include "cmsis_os.h"

/* Demo includes. */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes. */
#include "board.h"
#include "led_button.h"
#include "task_function.h"

/********************** macros and definitions *******************************/

/********************** internal data declaration ****************************/

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_sys	= " RTOS - Event-Triggered Systems (ETS)\r\n";
const char *p_app	= " freertos_app_example_4_6: Demo Code\r\n";

/********************** external data declaration *****************************/
/* Declare a variable of type QueueHandle_t. This is used to reference queues*/
QueueHandle_t h_queue_a;
QueueHandle_t h_queue_b;
QueueHandle_t h_queue_c;
/* Declare a variable of type xSemaphoreHandle (binary or counting) or mutex. 
 * This is used to reference the semaphore that is used to synchronize a thread
 * with other thread or to ensure mutual exclusive access to...*/

/* Declare a variable of type TaskHandle_t. This is used to reference threads. */
TaskHandle_t h_task_a;
TaskHandle_t h_task_aa;
TaskHandle_t h_task_b;
TaskHandle_t h_task_bb;
TaskHandle_t h_task_c;
TaskHandle_t h_task_cc;

/********************** external functions definition ************************/
void app_init(void)
{
	/* Print out: Application Initialized */
	LOGGER_LOG("\r\n");
	LOGGER_LOG("%s is running - Tick [mS] = %d\r\n", GET_NAME(app_init), (int)xTaskGetTickCount());

	LOGGER_LOG(p_sys);
	LOGGER_LOG(p_app);

    /* Before a queue or semaphore (binary or counting) or mutex is used it must 
     * be explicitly created */
	h_queue_a = xQueueCreate(2, sizeof(led_flag_t));
	h_queue_b = xQueueCreate(2, sizeof(led_flag_t));
	h_queue_c = xQueueCreate(2, sizeof(led_flag_t));

    /* Check the queue or semaphore (binary or counting) or mutex was created 
     * successfully. */
	configASSERT(h_queue_a != NULL);
	configASSERT(h_queue_b != NULL);
	configASSERT(h_queue_c != NULL);

    /* Add queue or semaphore (binary or counting) or mutex to registry. */
	vQueueAddToRegistry(h_queue_a, "A Queue Handle");
	vQueueAddToRegistry(h_queue_b, "B Queue Handle");
	vQueueAddToRegistry(h_queue_c, "C Queue Handle");

	/* Add threads, ... */
	led_config_t *p_led_config;
	btn_config_t *p_btn_config;
    BaseType_t ret;

    p_led_config = &led_config[0];
    p_btn_config = &btn_config[0];
    //led_config[0].q_handle = h_queue_a;
    p_led_config->q_handle = h_queue_a;
    p_btn_config->q_handle = h_queue_a;

    /* Task A thread at priority 1 */
    ret = xTaskCreate(task_led,							/* Pointer to the function thats implement the task. */
					  "Task A",							/* Text name for the task. This is to facilitate debugging only. */
					  (2 * configMINIMAL_STACK_SIZE),	/* Stack depth in words. */
					  (void *)p_led_config,             /* Pass the pointer as the task parameter. */
					  //(void *)&led_config[0],         // OTRA FORMA DE HACERLO
					  (tskIDLE_PRIORITY + 1ul),			/* This task will run at priority 1. */
					  &h_task_a);						/* We are using a variable as task handle. */

    /* Check the thread was created successfully. */
    configASSERT(pdPASS == ret);

    /* Task AA thread at priority 1 */
    ret = xTaskCreate(task_btn,							/* Pointer to the function thats implement the task. */
					  "Task AA",						/* Text name for the task. This is to facilitate debugging only. */
					  (2 * configMINIMAL_STACK_SIZE),	/* Stack depth in words. */
					  (void *)p_btn_config,   		    /* Pass the pointer as the task parameter. */
					  (tskIDLE_PRIORITY + 1ul),			/* This task will run at priority 1. */
					  &h_task_aa);						/* We are using a variable as task handle. */

    /* Check the thread was created successfully. */
    configASSERT(pdPASS == ret);

    p_led_config = &led_config[1];
    p_btn_config = &btn_config[1];

    p_led_config->q_handle = h_queue_b;
    p_btn_config->q_handle = h_queue_b;

    /* Task B thread at priority 1 */
    ret = xTaskCreate(task_led,							/* Pointer to the function thats implement the task. */
					  "Task B",							/* Text name for the task. This is to facilitate debugging only. */
					  (2 * configMINIMAL_STACK_SIZE),	/* Stack depth in words. */
					  (void *)p_led_config,    		/* Pass the pointer as the task parameter. */
					  (tskIDLE_PRIORITY + 1ul),			/* This task will run at priority 1. */
					  &h_task_b);						/* We are using a variable as task handle. */

    /* Check the thread was created successfully. */
    configASSERT(pdPASS == ret);

    /* Task BB thread at priority 1 */
    ret = xTaskCreate(task_btn,							/* Pointer to the function thats implement the task. */
					  "Task BB",						/* Text name for the task. This is to facilitate debugging only. */
					  (2 * configMINIMAL_STACK_SIZE),	/* Stack depth in words. */
					  (void *)p_btn_config,    		/* Pass the pointer as the task parameter. */
					  (tskIDLE_PRIORITY + 1ul),			/* This task will run at priority 1. */
					  &h_task_bb);						/* We are using a variable as task handle. */

    /* Check the thread was created successfully. */
    configASSERT(pdPASS == ret);

    p_led_config = &led_config[2];
    p_btn_config = &btn_config[2];

    p_led_config->q_handle = h_queue_c;
    p_btn_config->q_handle = h_queue_c;
    /* Task C thread at priority 1 */
    ret = xTaskCreate(task_led,							/* Pointer to the function thats implement the task. */
					  "Task C",							/* Text name for the task. This is to facilitate debugging only. */
					  (2 * configMINIMAL_STACK_SIZE),	/* Stack depth in words. */
					  (void *)p_led_config,    		/* Pass the pointer as the task parameter. */
					  (tskIDLE_PRIORITY + 1ul),			/* This task will run at priority 1. */
					  &h_task_c);						/* We are using a variable as task handle. */

    /* Check the thread was created successfully. */
    configASSERT(pdPASS == ret);

    /* Task CC thread at priority 1 */
    ret = xTaskCreate(task_btn,							/* Pointer to the function thats implement the task. */
					  "Task CC",						/* Text name for the task. This is to facilitate debugging only. */
					  (2 * configMINIMAL_STACK_SIZE),	/* Stack depth in words. */
					  (void *)p_btn_config,    		/* Pass the pointer as the task parameter. */
					  (tskIDLE_PRIORITY + 1ul),			/* This task will run at priority 1. */
					  &h_task_cc);						/* We are using a variable as task handle. */

    /* Check the thread was created successfully. */
    configASSERT(pdPASS == ret);

    cycle_counter_init();
}

/********************** end of file ******************************************/
