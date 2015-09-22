/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/xilinx/pcores/microblaze_v8_00_b/hdl/vhdl/zero_detect_gti.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_3488546069778340532_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void microblaze_v8_00_b_a_3953197049_3306564128_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(184, ng0);
    t1 = (t0 + 2880U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB3;

LAB4:
LAB5:    t8 = (t0 + 11176);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 10920);
    *((int *)t13) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 11176);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(185, ng0);
    t1 = (t0 + 3040U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB3;

LAB4:
LAB5:    t8 = (t0 + 11240);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 10936);
    *((int *)t13) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 11240);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(194, ng0);

LAB3:    t1 = (t0 + 4000U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11304);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);

LAB2:    t8 = (t0 + 10952);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(199, ng0);
    t1 = xsi_get_transient_memory(36U);
    memset(t1, 0, 36U);
    t2 = t1;
    memset(t2, (unsigned char)2, 36U);
    t3 = (t0 + 11368);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 36U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(200, ng0);
    t1 = (t0 + 3200U);
    t2 = *((char **)t1);
    t1 = (t0 + 11368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_delta(t1, 0U, 32U, 0LL);
    t1 = (t0 + 10968);
    *((int *)t1) = 1;

LAB1:    return;
}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_4(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(210, ng0);
    t1 = (t0 + 5696U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(211, ng0);
    t1 = (t0 + 5216U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 - 1);
    t1 = (t0 + 19833);
    *((int *)t1) = t4;
    t5 = (t0 + 19837);
    *((int *)t5) = 0;
    t6 = t4;
    t7 = 0;

LAB2:    if (t6 >= t7)
        goto LAB3;

LAB5:    xsi_set_current_line(215, ng0);
    t1 = (t0 + 5696U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t33 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t10);
    t1 = (t0 + 11432);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t33;
    xsi_driver_first_trans_delta(t1, 5U, 1, 0LL);
    t1 = (t0 + 10984);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(212, ng0);
    t8 = (t0 + 5696U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 3680U);
    t11 = *((char **)t8);
    t8 = (t0 + 5456U);
    t12 = *((char **)t8);
    t13 = *((int *)t12);
    t8 = (t0 + 5216U);
    t14 = *((char **)t8);
    t15 = *((int *)t14);
    t16 = (t13 * t15);
    t8 = (t0 + 5576U);
    t17 = *((char **)t8);
    t18 = *((int *)t17);
    t8 = (t0 + 5216U);
    t19 = *((char **)t8);
    t20 = *((int *)t19);
    t21 = (t18 * t20);
    t22 = (t16 - t21);
    t8 = (t0 + 5216U);
    t23 = *((char **)t8);
    t24 = *((int *)t23);
    t25 = (t22 - t24);
    t8 = (t0 + 19833);
    t26 = *((int *)t8);
    t27 = (t25 + t26);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 35, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = (t11 + t31);
    t33 = *((unsigned char *)t32);
    t34 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t10, t33);
    t35 = (t0 + 5696U);
    t36 = *((char **)t35);
    t35 = (t36 + 0);
    *((unsigned char *)t35) = t34;

LAB4:    t1 = (t0 + 19833);
    t6 = *((int *)t1);
    t2 = (t0 + 19837);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB5;

LAB6:    t3 = (t6 + -1);
    t6 = t3;
    t5 = (t0 + 19833);
    *((int *)t5) = t6;
    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_5(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(210, ng0);
    t1 = (t0 + 5936U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(211, ng0);
    t1 = (t0 + 5216U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 - 1);
    t1 = (t0 + 19841);
    *((int *)t1) = t4;
    t5 = (t0 + 19845);
    *((int *)t5) = 0;
    t6 = t4;
    t7 = 0;

LAB2:    if (t6 >= t7)
        goto LAB3;

LAB5:    xsi_set_current_line(215, ng0);
    t1 = (t0 + 5936U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t33 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t10);
    t1 = (t0 + 11496);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t33;
    xsi_driver_first_trans_delta(t1, 4U, 1, 0LL);
    t1 = (t0 + 11000);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(212, ng0);
    t8 = (t0 + 5936U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 3680U);
    t11 = *((char **)t8);
    t8 = (t0 + 5456U);
    t12 = *((char **)t8);
    t13 = *((int *)t12);
    t8 = (t0 + 5216U);
    t14 = *((char **)t8);
    t15 = *((int *)t14);
    t16 = (t13 * t15);
    t8 = (t0 + 5816U);
    t17 = *((char **)t8);
    t18 = *((int *)t17);
    t8 = (t0 + 5216U);
    t19 = *((char **)t8);
    t20 = *((int *)t19);
    t21 = (t18 * t20);
    t22 = (t16 - t21);
    t8 = (t0 + 5216U);
    t23 = *((char **)t8);
    t24 = *((int *)t23);
    t25 = (t22 - t24);
    t8 = (t0 + 19841);
    t26 = *((int *)t8);
    t27 = (t25 + t26);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 35, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = (t11 + t31);
    t33 = *((unsigned char *)t32);
    t34 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t10, t33);
    t35 = (t0 + 5936U);
    t36 = *((char **)t35);
    t35 = (t36 + 0);
    *((unsigned char *)t35) = t34;

LAB4:    t1 = (t0 + 19841);
    t6 = *((int *)t1);
    t2 = (t0 + 19845);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB5;

LAB6:    t3 = (t6 + -1);
    t6 = t3;
    t5 = (t0 + 19841);
    *((int *)t5) = t6;
    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_6(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(210, ng0);
    t1 = (t0 + 6176U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(211, ng0);
    t1 = (t0 + 5216U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 - 1);
    t1 = (t0 + 19849);
    *((int *)t1) = t4;
    t5 = (t0 + 19853);
    *((int *)t5) = 0;
    t6 = t4;
    t7 = 0;

LAB2:    if (t6 >= t7)
        goto LAB3;

LAB5:    xsi_set_current_line(215, ng0);
    t1 = (t0 + 6176U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t33 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t10);
    t1 = (t0 + 11560);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t33;
    xsi_driver_first_trans_delta(t1, 3U, 1, 0LL);
    t1 = (t0 + 11016);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(212, ng0);
    t8 = (t0 + 6176U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 3680U);
    t11 = *((char **)t8);
    t8 = (t0 + 5456U);
    t12 = *((char **)t8);
    t13 = *((int *)t12);
    t8 = (t0 + 5216U);
    t14 = *((char **)t8);
    t15 = *((int *)t14);
    t16 = (t13 * t15);
    t8 = (t0 + 6056U);
    t17 = *((char **)t8);
    t18 = *((int *)t17);
    t8 = (t0 + 5216U);
    t19 = *((char **)t8);
    t20 = *((int *)t19);
    t21 = (t18 * t20);
    t22 = (t16 - t21);
    t8 = (t0 + 5216U);
    t23 = *((char **)t8);
    t24 = *((int *)t23);
    t25 = (t22 - t24);
    t8 = (t0 + 19849);
    t26 = *((int *)t8);
    t27 = (t25 + t26);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 35, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = (t11 + t31);
    t33 = *((unsigned char *)t32);
    t34 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t10, t33);
    t35 = (t0 + 6176U);
    t36 = *((char **)t35);
    t35 = (t36 + 0);
    *((unsigned char *)t35) = t34;

LAB4:    t1 = (t0 + 19849);
    t6 = *((int *)t1);
    t2 = (t0 + 19853);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB5;

LAB6:    t3 = (t6 + -1);
    t6 = t3;
    t5 = (t0 + 19849);
    *((int *)t5) = t6;
    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_7(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(210, ng0);
    t1 = (t0 + 6416U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(211, ng0);
    t1 = (t0 + 5216U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 - 1);
    t1 = (t0 + 19857);
    *((int *)t1) = t4;
    t5 = (t0 + 19861);
    *((int *)t5) = 0;
    t6 = t4;
    t7 = 0;

LAB2:    if (t6 >= t7)
        goto LAB3;

LAB5:    xsi_set_current_line(215, ng0);
    t1 = (t0 + 6416U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t33 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t10);
    t1 = (t0 + 11624);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t33;
    xsi_driver_first_trans_delta(t1, 2U, 1, 0LL);
    t1 = (t0 + 11032);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(212, ng0);
    t8 = (t0 + 6416U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 3680U);
    t11 = *((char **)t8);
    t8 = (t0 + 5456U);
    t12 = *((char **)t8);
    t13 = *((int *)t12);
    t8 = (t0 + 5216U);
    t14 = *((char **)t8);
    t15 = *((int *)t14);
    t16 = (t13 * t15);
    t8 = (t0 + 6296U);
    t17 = *((char **)t8);
    t18 = *((int *)t17);
    t8 = (t0 + 5216U);
    t19 = *((char **)t8);
    t20 = *((int *)t19);
    t21 = (t18 * t20);
    t22 = (t16 - t21);
    t8 = (t0 + 5216U);
    t23 = *((char **)t8);
    t24 = *((int *)t23);
    t25 = (t22 - t24);
    t8 = (t0 + 19857);
    t26 = *((int *)t8);
    t27 = (t25 + t26);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 35, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = (t11 + t31);
    t33 = *((unsigned char *)t32);
    t34 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t10, t33);
    t35 = (t0 + 6416U);
    t36 = *((char **)t35);
    t35 = (t36 + 0);
    *((unsigned char *)t35) = t34;

LAB4:    t1 = (t0 + 19857);
    t6 = *((int *)t1);
    t2 = (t0 + 19861);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB5;

LAB6:    t3 = (t6 + -1);
    t6 = t3;
    t5 = (t0 + 19857);
    *((int *)t5) = t6;
    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_8(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(210, ng0);
    t1 = (t0 + 6656U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(211, ng0);
    t1 = (t0 + 5216U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 - 1);
    t1 = (t0 + 19865);
    *((int *)t1) = t4;
    t5 = (t0 + 19869);
    *((int *)t5) = 0;
    t6 = t4;
    t7 = 0;

LAB2:    if (t6 >= t7)
        goto LAB3;

LAB5:    xsi_set_current_line(215, ng0);
    t1 = (t0 + 6656U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t33 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t10);
    t1 = (t0 + 11688);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t33;
    xsi_driver_first_trans_delta(t1, 1U, 1, 0LL);
    t1 = (t0 + 11048);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(212, ng0);
    t8 = (t0 + 6656U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 3680U);
    t11 = *((char **)t8);
    t8 = (t0 + 5456U);
    t12 = *((char **)t8);
    t13 = *((int *)t12);
    t8 = (t0 + 5216U);
    t14 = *((char **)t8);
    t15 = *((int *)t14);
    t16 = (t13 * t15);
    t8 = (t0 + 6536U);
    t17 = *((char **)t8);
    t18 = *((int *)t17);
    t8 = (t0 + 5216U);
    t19 = *((char **)t8);
    t20 = *((int *)t19);
    t21 = (t18 * t20);
    t22 = (t16 - t21);
    t8 = (t0 + 5216U);
    t23 = *((char **)t8);
    t24 = *((int *)t23);
    t25 = (t22 - t24);
    t8 = (t0 + 19865);
    t26 = *((int *)t8);
    t27 = (t25 + t26);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 35, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = (t11 + t31);
    t33 = *((unsigned char *)t32);
    t34 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t10, t33);
    t35 = (t0 + 6656U);
    t36 = *((char **)t35);
    t35 = (t36 + 0);
    *((unsigned char *)t35) = t34;

LAB4:    t1 = (t0 + 19865);
    t6 = *((int *)t1);
    t2 = (t0 + 19869);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB5;

LAB6:    t3 = (t6 + -1);
    t6 = t3;
    t5 = (t0 + 19865);
    *((int *)t5) = t6;
    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_9(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    char *t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned char t33;
    unsigned char t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(210, ng0);
    t1 = (t0 + 6896U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(211, ng0);
    t1 = (t0 + 5216U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t4 = (t3 - 1);
    t1 = (t0 + 19873);
    *((int *)t1) = t4;
    t5 = (t0 + 19877);
    *((int *)t5) = 0;
    t6 = t4;
    t7 = 0;

LAB2:    if (t6 >= t7)
        goto LAB3;

LAB5:    xsi_set_current_line(215, ng0);
    t1 = (t0 + 6896U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t33 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t10);
    t1 = (t0 + 11752);
    t5 = (t1 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = t33;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    t1 = (t0 + 11064);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(212, ng0);
    t8 = (t0 + 6896U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 3680U);
    t11 = *((char **)t8);
    t8 = (t0 + 5456U);
    t12 = *((char **)t8);
    t13 = *((int *)t12);
    t8 = (t0 + 5216U);
    t14 = *((char **)t8);
    t15 = *((int *)t14);
    t16 = (t13 * t15);
    t8 = (t0 + 6776U);
    t17 = *((char **)t8);
    t18 = *((int *)t17);
    t8 = (t0 + 5216U);
    t19 = *((char **)t8);
    t20 = *((int *)t19);
    t21 = (t18 * t20);
    t22 = (t16 - t21);
    t8 = (t0 + 5216U);
    t23 = *((char **)t8);
    t24 = *((int *)t23);
    t25 = (t22 - t24);
    t8 = (t0 + 19873);
    t26 = *((int *)t8);
    t27 = (t25 + t26);
    t28 = (t27 - 0);
    t29 = (t28 * 1);
    xsi_vhdl_check_range_of_index(0, 35, 1, t27);
    t30 = (1U * t29);
    t31 = (0 + t30);
    t32 = (t11 + t31);
    t33 = *((unsigned char *)t32);
    t34 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t10, t33);
    t35 = (t0 + 6896U);
    t36 = *((char **)t35);
    t35 = (t36 + 0);
    *((unsigned char *)t35) = t34;

LAB4:    t1 = (t0 + 19873);
    t6 = *((int *)t1);
    t2 = (t0 + 19877);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB5;

LAB6:    t3 = (t6 + -1);
    t6 = t3;
    t5 = (t0 + 19873);
    *((int *)t5) = t6;
    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_10(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(228, ng0);

LAB3:    t1 = (t0 + 4320U);
    t2 = *((char **)t1);
    t1 = (t0 + 5456U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 6);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t1 = (t2 + t8);
    t9 = *((unsigned char *)t1);
    t10 = (t9 == (unsigned char)3);
    t11 = (t0 + 11816);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t10;
    xsi_driver_first_trans_fast(t11);

LAB2:    t16 = (t0 + 11080);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_3953197049_3306564128_p_11(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(232, ng0);

LAB3:    t1 = (t0 + 3520U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11880);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 11096);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void microblaze_v8_00_b_a_3953197049_3306564128_init()
{
	static char *pe[] = {(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_0,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_1,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_2,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_3,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_4,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_5,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_6,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_7,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_8,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_9,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_10,(void *)microblaze_v8_00_b_a_3953197049_3306564128_p_11};
	xsi_register_didat("microblaze_v8_00_b_a_3953197049_3306564128", "isim/isim_system_axisim.sim/microblaze_v8_00_b/a_3953197049_3306564128.didat");
	xsi_register_executes(pe);
}
