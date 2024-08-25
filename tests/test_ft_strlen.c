/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_ft_strlen.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: garaujo <garaujo@student.42wolfsburg.de>   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/08/25 22:24:31 by garaujo           #+#    #+#             */
/*   Updated: 2024/08/26 00:58:29 by garaujo          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <setjmp.h>
#include <stdint.h>
#include "cmocka.h"
#include "libft.h"

static void	test_ft_strlen(void **state)
{
	(void) state;
	assert_int_equal(ft_strlen(""), 0);
	assert_int_equal(ft_strlen("Hello\nWorld"), 11);
	assert_int_equal(ft_strlen("World!"), 6);
}

int	main(void)
{
	const struct CMUnitTest	tests[] = {
		cmocka_unit_test(test_ft_strlen),
	};
	return (cmocka_run_group_tests(tests, NULL, NULL));
}
