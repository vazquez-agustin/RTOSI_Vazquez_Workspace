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
 * @file   : task_function.c
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
#include "app.h"

/********************** macros and definitions *******************************/
#define G_TASK_FUNCTION_CNT_INI	0u

#define BTN_TICK_CNT_MAX		250ul
#define LED_TICK_CNT_MAX		250ul

/********************** internal data declaration ****************************/

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_function = "Task FUNCTION - Demo Code";

const char *p_task_blinking_on = "Blinking turn On ";
const char *p_task_blinking_off = "Blinking turn Off";

const char *p_task_led_t_on = "LDX turn On ";
const char *p_task_led_t_off = "LDX turn Off";

led_btn_cfg_t led_btn_cfg[] = {
{
		// A_PORT
		// LED
		.led_gpio_port = LED_A_PORT, .led_pin = LED_A_PIN, .led_state = 0,
		.led_flag = 0, .led_tick_cnt = 0,
		// BUTTON
		.btn_gpio_port = BTN_A_PORT, .btn_pin = BTN_A_PIN, .btn_state = 0,
		.btn_flag = 0, .btn_tick_cnt = 0

}, {
		// B_PORT
		// LED
		.led_gpio_port = LED_B_PORT, .led_pin = LED_B_PIN, .led_state = 0,
		.led_flag = 0, .led_tick_cnt = 0,
		// BUTTON
		.btn_gpio_port = BTN_B_PORT, .btn_pin = BTN_B_PIN, .btn_state = 0,
		.btn_flag = 0, .btn_tick_cnt = 0

}, {
		// A_PORT
		// LED
		.led_gpio_port = LED_C_PORT, .led_pin = LED_C_PIN, .led_state = 0,
		.led_flag = 0, .led_tick_cnt = 0,
		// BUTTON
		.btn_gpio_port = BTN_C_PORT, .btn_pin = BTN_C_PIN, .btn_state = 0,
		.btn_flag = 0, .btn_tick_cnt = 0

}

};

/********************** external data declaration ****************************/
uint32_t g_task_function_cnt;

/********************** external functions definition ************************/
/* Task A, B and C thread */
void task_function(void *parameters) {
#if (TEST_X == TEST_0)
	g_task_function_cnt = G_TASK_FUNCTION_CNT_INI;

	/*  Declare & Initialize Task Function variables for argument, led, button and task */
	led_btn_cfg_t * xData = (led_btn_cfg_t *)parameters;

	xData->led_flag = NOT_BLINKING;
	xData->led_state = GPIO_PIN_RESET;
	xData->led_tick_cnt = xTaskGetTickCount();

	xData->btn_tick_cnt = xTaskGetTickCount();
	xData->btn_state = BTN_HOVER;

	char *p_task_name = (char*) pcTaskGetName(NULL);

	/* Print out: Application Update */
	LOGGER_LOG("  %s is running - %s\r\n", p_task_name, p_task_function);

#endif

#if (TEST_X == TEST_1)

	/* Here another code option */

	#endif

#if (TEST_X == TEST_2)

	/* Here Chatbot Artificial Intelligence generated code */

	#endif

	/* As per most tasks, this task is implemented in an infinite loop. */
	for (;;) {

#if (TEST_X == TEST_0)

		/* Update Task A Counter */
		g_task_function_cnt++;

		/* Check HW Button State */
		xData->btn_state = HAL_GPIO_ReadPin(xData->btn_gpio_port, xData->btn_pin);
		if (BTN_PRESSED == xData->btn_state) {
			/* Delay for a period using Tick Count */
			if (BTN_TICK_CNT_MAX <= (xTaskGetTickCount() - xData->btn_tick_cnt)) {
				/* Check, Update and Print Led Flag */
				if (NOT_BLINKING == xData->led_flag) {
					xData->led_flag = BLINKING;

					/* Print out: Task execution */
					LOGGER_LOG("  %s - %s\r\n", p_task_name, p_task_blinking_on);
				} else {
					xData->led_flag = NOT_BLINKING;

					/* Print out: Task execution */
					LOGGER_LOG("  %s - %s\r\n", p_task_name,
							p_task_blinking_off);
				}
				/* Update and Button Tick Counter */
				xData->btn_tick_cnt = xTaskGetTickCount();
			}
		}

		/* Check Led Flag */
		if (BLINKING == xData->led_flag) {
			/* Delay for a period using Tick Count. */
			if (LED_TICK_CNT_MAX <= (xTaskGetTickCount() - xData->led_tick_cnt)) {
				/* Check, Update and Print Led State */
				if (GPIO_PIN_RESET == xData->led_state) {
					xData->led_state = LED_ON;

					/* Print out: Task execution */
					//LOGGER_LOG("  %s - %s\r\n", p_task_name, p_task_led_t_on);
				} else {
					xData->led_state = LED_OFF;

					/* Print out: Task execution */
					//LOGGER_LOG("  %s - %s\r\n", p_task_name, p_task_led_t_off);
				}
				/* Update HW Led State */
				HAL_GPIO_WritePin(xData->led_gpio_port, xData->led_pin,
						xData->led_state);

				/* Update and Led Tick Counter */
				xData->led_tick_cnt = xTaskGetTickCount();
			}
		}

#endif

#if (TEST_X == TEST_1)

		/* Here another code option */

		#endif

#if (TEST_X == TEST_2)

		/* Here Chatbot Artificial Intelligence generated code */

		#endif
	}
}

/********************** end of file ******************************************/
