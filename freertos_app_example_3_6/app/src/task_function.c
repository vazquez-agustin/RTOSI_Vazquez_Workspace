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
#define G_TASK_FUNCTION_CNT_INI	0ul

#define BTN_TICK_CNT_MAX		250ul  // "ul" means unsigned long
#define LED_TICK_CNT_MAX		250ul

/********************** internal data declaration ****************************/

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_button = "Task FUNCTION BTN - Demo Code";
const char *p_task_led = "Task FUNCTION LED - Demo Code";

const char *p_task_blinking_on = "Blinking turn On ";
const char *p_task_blinking_off = "Blinking turn Off";

const char *p_task_ldx_t_on = "LDX turn On ";
const char *p_task_ldx_t_off = "LDX turn Off";

ldx_btn_config_t ldx_btn_config[] = {
		{ LED_A_PORT, LED_A_PIN, LED_OFF, NOT_BLINKING, BTN_A_PORT, BTN_A_PIN, BTN_HOVER, NOT_PRESSED },
		{LED_B_PORT, LED_B_PIN, LED_OFF, NOT_BLINKING, BTN_B_PORT, BTN_B_PIN, BTN_HOVER, NOT_PRESSED },
        { LED_C_PORT, LED_C_PIN, LED_OFF, NOT_BLINKING, BTN_C_PORT, BTN_C_PIN, BTN_HOVER, NOT_PRESSED }
};

/********************** external data declaration *****************************/
uint32_t g_task_function_cnt;

/********************** external functions definition ************************/
void task_button(void *parameters) {

	const TickType_t xDelay250ms = pdMS_TO_TICKS(BTN_TICK_CNT_MAX);

	/*  Declare & Initialize Task Function variables for argument, led, button and task */
	ldx_btn_config_t *p_ldx_btn_config = (ldx_btn_config_t*) parameters;

	char *p_task_name = (char*) pcTaskGetName(NULL);

	/* Print out: Application Update */
	LOGGER_LOG("  %s is running - %s\r\n", p_task_name, p_task_button);

	/* As per most tasks, this task is implemented in an infinite loop. */
	for (;;) {
		/* Check HW Button State */
		p_ldx_btn_config->btn_state = HAL_GPIO_ReadPin(p_ldx_btn_config->btn_gpio_port, p_ldx_btn_config->btn_pin);
		if (BTN_PRESSED == p_ldx_btn_config->btn_state) {
			/* Check, Update and Print Led Flag */
			if (NOT_BLINKING == (p_ldx_btn_config->led_flag)) {
				p_ldx_btn_config->led_flag = BLINKING;

				/* Print out: Task execution */
				LOGGER_LOG("  %s - %s\r\n", p_task_name, p_task_blinking_on);
			} else {
				p_ldx_btn_config->led_flag = NOT_BLINKING;
				/* Print out: Task execution */
				LOGGER_LOG("  %s - %s\r\n", p_task_name, p_task_blinking_off);
			}
		}
		// It blocks the task during 250ms, freeing CPU use
		vTaskDelay(xDelay250ms);
	}

}

void task_led(void *parameters) {

	const TickType_t xDelay250ms = pdMS_TO_TICKS(LED_TICK_CNT_MAX);
	TickType_t xLastWakeTime = xTaskGetTickCount();

	/*  Declare & Initialize Task Function variables for argument, led, button and task */
	ldx_btn_config_t *p_ldx_btn_config = (ldx_btn_config_t*) parameters;

	char *p_task_name = (char*) pcTaskGetName(NULL);

	/* Print out: Application Update */
	LOGGER_LOG("  %s is running - %s\r\n", p_task_name, p_task_led);

	/* As per most tasks, this task is implemented in an infinite loop. */
	for (;;) {
		/* Check Led Flag */
		if (BLINKING == (p_ldx_btn_config->led_flag)) {
			/* Check, Update and Print Led State */
			if (GPIO_PIN_RESET == (p_ldx_btn_config->led_state)) {
				p_ldx_btn_config->led_state = GPIO_PIN_SET;

				/* Print out: Task execution */
				//LOGGER_LOG("  %s - %s\r\n", p_task_name, p_task_ldx_t_on);
			} else {
				p_ldx_btn_config->led_state = GPIO_PIN_RESET;

				/* Print out: Task execution */
				//LOGGER_LOG("  %s - %s\r\n", p_task_name, p_task_ldx_t_off);
			}
			/* Update HW Led State */
			HAL_GPIO_WritePin(p_ldx_btn_config->led_gpio_port,
					p_ldx_btn_config->led_pin, p_ldx_btn_config->led_state);
		}
		vTaskDelayUntil(&xLastWakeTime, xDelay250ms);
	}

}

/********************** end of file ******************************************/
