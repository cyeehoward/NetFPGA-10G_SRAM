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
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/xilinx/pcores/microblaze_v8_00_b/hdl/vhdl/jump_logic_gti.vhd";
extern char *MICROBLAZE_V8_00_B_P_1761634766;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_3488546069778340532_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768496604610246_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void microblaze_v8_00_b_a_2491771233_3306564128_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 1256U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 15808);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(164, ng0);
    t4 = (t0 + 1776U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    if (t9 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 2576U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    if (t1 != 0)
        goto LAB11;

LAB12:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1296U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(165, ng0);
    t4 = (t0 + 16176);
    t10 = (t4 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)0;
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 16176);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(174, ng0);

LAB3:    t1 = (t0 + 5776U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 16240);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);

LAB2:    t8 = (t0 + 15824);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_2(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 1256U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 15840);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(183, ng0);
    t4 = (t0 + 1776U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    if (t9 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 4976U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    if (t1 != 0)
        goto LAB11;

LAB12:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1296U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(184, ng0);
    t4 = (t0 + 16304);
    t10 = (t4 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)0;
    xsi_driver_first_trans_fast(t4);
    goto LAB9;

LAB11:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 16304);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    int t32;
    int t33;
    int t34;
    int t35;
    int t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;

LAB0:    xsi_set_current_line(452, ng0);
    t2 = (t0 + 1256U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 15856);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(453, ng0);
    t4 = (t0 + 1456U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 1616U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    if (t1 != 0)
        goto LAB11;

LAB12:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1296U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(454, ng0);
    t4 = (t0 + 16368);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)1;
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(455, ng0);
    t2 = (t0 + 16432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(456, ng0);
    t2 = (t0 + 16496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(457, ng0);
    t2 = (t0 + 16560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(458, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(459, ng0);
    t2 = (t0 + 16688);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(460, ng0);
    t2 = (t0 + 16752);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(461, ng0);
    t2 = (t0 + 16816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB9;

LAB11:    xsi_set_current_line(463, ng0);
    t2 = (t0 + 2096U);
    t5 = *((char **)t2);
    t15 = (8 - 0);
    t16 = (t15 * 1);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t2 = (t5 + t18);
    t8 = (t0 + 9552U);
    t11 = *((char **)t8);
    t8 = (t11 + 0);
    memcpy(t8, t2, 3U);
    xsi_set_current_line(465, ng0);
    t2 = (t0 + 16752);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(466, ng0);
    t2 = (t0 + 16816);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(467, ng0);
    t2 = (t0 + 16368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(468, ng0);
    t2 = (t0 + 16432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(469, ng0);
    t2 = (t0 + 16496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(470, ng0);
    t2 = (t0 + 16560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(471, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(472, ng0);
    t2 = (t0 + 16688);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(474, ng0);
    t2 = (t0 + 2096U);
    t4 = *((char **)t2);
    t15 = (0 - 0);
    t16 = (t15 * 1);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t2 = (t4 + t18);
    t5 = ((MICROBLAZE_V8_00_B_P_1761634766) + 29728U);
    t8 = *((char **)t5);
    t3 = 1;
    if (6U == 6U)
        goto LAB19;

LAB20:    t3 = 0;

LAB21:    if (t3 == 1)
        goto LAB16;

LAB17:    t12 = (t0 + 2096U);
    t13 = *((char **)t12);
    t20 = (0 - 0);
    t21 = (t20 * 1);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t12 = (t13 + t23);
    t14 = ((MICROBLAZE_V8_00_B_P_1761634766) + 29848U);
    t24 = *((char **)t14);
    t6 = 1;
    if (6U == 6U)
        goto LAB25;

LAB26:    t6 = 0;

LAB27:    t1 = t6;

LAB18:    if (t1 != 0)
        goto LAB13;

LAB15:    t2 = (t0 + 2096U);
    t4 = *((char **)t2);
    t15 = (0 - 0);
    t16 = (t15 * 1);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t2 = (t4 + t18);
    t5 = ((MICROBLAZE_V8_00_B_P_1761634766) + 28168U);
    t8 = *((char **)t5);
    t6 = 1;
    if (6U == 6U)
        goto LAB54;

LAB55:    t6 = 0;

LAB56:    if (t6 == 1)
        goto LAB51;

LAB52:    t12 = (t0 + 2096U);
    t13 = *((char **)t12);
    t20 = (0 - 0);
    t21 = (t20 * 1);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t12 = (t13 + t23);
    t14 = ((MICROBLAZE_V8_00_B_P_1761634766) + 28288U);
    t24 = *((char **)t14);
    t7 = 1;
    if (6U == 6U)
        goto LAB60;

LAB61:    t7 = 0;

LAB62:    t3 = t7;

LAB53:    if (t3 == 1)
        goto LAB48;

LAB49:    t27 = (t0 + 2096U);
    t28 = *((char **)t27);
    t38 = (0 - 0);
    t39 = (t38 * 1);
    t40 = (t39 * 1U);
    t41 = (0 + t40);
    t27 = (t28 + t41);
    t29 = ((MICROBLAZE_V8_00_B_P_1761634766) + 27088U);
    t30 = *((char **)t29);
    t9 = 1;
    if (6U == 6U)
        goto LAB66;

LAB67:    t9 = 0;

LAB68:    t1 = t9;

LAB50:    if (t1 != 0)
        goto LAB46;

LAB47:
LAB14:    goto LAB9;

LAB13:    xsi_set_current_line(475, ng0);
    t27 = (t0 + 16816);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = (unsigned char)3;
    xsi_driver_first_trans_fast(t27);
    xsi_set_current_line(476, ng0);
    t2 = (t0 + 9552U);
    t4 = *((char **)t2);
    t2 = ((MICROBLAZE_V8_00_B_P_1761634766) + 30328U);
    t5 = *((char **)t2);
    t32 = xsi_mem_cmp(t5, t4, 3U);
    if (t32 == 1)
        goto LAB32;

LAB39:    t2 = ((MICROBLAZE_V8_00_B_P_1761634766) + 30448U);
    t8 = *((char **)t2);
    t33 = xsi_mem_cmp(t8, t4, 3U);
    if (t33 == 1)
        goto LAB33;

LAB40:    t2 = ((MICROBLAZE_V8_00_B_P_1761634766) + 30568U);
    t11 = *((char **)t2);
    t34 = xsi_mem_cmp(t11, t4, 3U);
    if (t34 == 1)
        goto LAB34;

LAB41:    t2 = ((MICROBLAZE_V8_00_B_P_1761634766) + 30928U);
    t12 = *((char **)t2);
    t35 = xsi_mem_cmp(t12, t4, 3U);
    if (t35 == 1)
        goto LAB35;

LAB42:    t2 = ((MICROBLAZE_V8_00_B_P_1761634766) + 30688U);
    t13 = *((char **)t2);
    t36 = xsi_mem_cmp(t13, t4, 3U);
    if (t36 == 1)
        goto LAB36;

LAB43:    t2 = ((MICROBLAZE_V8_00_B_P_1761634766) + 30808U);
    t14 = *((char **)t2);
    t37 = xsi_mem_cmp(t14, t4, 3U);
    if (t37 == 1)
        goto LAB37;

LAB44:
LAB38:    xsi_set_current_line(513, ng0);

LAB31:    goto LAB14;

LAB16:    t1 = (unsigned char)1;
    goto LAB18;

LAB19:    t19 = 0;

LAB22:    if (t19 < 6U)
        goto LAB23;
    else
        goto LAB21;

LAB23:    t5 = (t2 + t19);
    t11 = (t8 + t19);
    if (*((unsigned char *)t5) != *((unsigned char *)t11))
        goto LAB20;

LAB24:    t19 = (t19 + 1);
    goto LAB22;

LAB25:    t25 = 0;

LAB28:    if (t25 < 6U)
        goto LAB29;
    else
        goto LAB27;

LAB29:    t14 = (t12 + t25);
    t26 = (t24 + t25);
    if (*((unsigned char *)t14) != *((unsigned char *)t26))
        goto LAB26;

LAB30:    t25 = (t25 + 1);
    goto LAB28;

LAB32:    xsi_set_current_line(479, ng0);
    t2 = (t0 + 16496);
    t24 = (t2 + 56U);
    t26 = *((char **)t24);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    *((unsigned char *)t28) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(480, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB31;

LAB33:    xsi_set_current_line(483, ng0);
    t2 = (t0 + 16496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(484, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(485, ng0);
    t2 = (t0 + 16368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(486, ng0);
    t2 = (t0 + 16432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB31;

LAB34:    xsi_set_current_line(489, ng0);
    t2 = (t0 + 16496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(490, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(491, ng0);
    t2 = (t0 + 16560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(492, ng0);
    t2 = (t0 + 16688);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB31;

LAB35:    xsi_set_current_line(495, ng0);
    t2 = (t0 + 16496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(496, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(497, ng0);
    t2 = (t0 + 16560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(498, ng0);
    t2 = (t0 + 16688);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB31;

LAB36:    xsi_set_current_line(501, ng0);
    t2 = (t0 + 16496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(502, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(503, ng0);
    t2 = (t0 + 16560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(504, ng0);
    t2 = (t0 + 16688);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    goto LAB31;

LAB37:    xsi_set_current_line(507, ng0);
    t2 = (t0 + 16496);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(508, ng0);
    t2 = (t0 + 16624);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(509, ng0);
    t2 = (t0 + 16560);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(510, ng0);
    t2 = (t0 + 16688);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(511, ng0);
    t2 = (t0 + 16368);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(512, ng0);
    t2 = (t0 + 16432);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB31;

LAB45:;
LAB46:    xsi_set_current_line(517, ng0);
    t43 = (t0 + 16752);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    *((unsigned char *)t47) = (unsigned char)2;
    xsi_driver_first_trans_fast(t43);
    goto LAB14;

LAB48:    t1 = (unsigned char)1;
    goto LAB50;

LAB51:    t3 = (unsigned char)1;
    goto LAB53;

LAB54:    t19 = 0;

LAB57:    if (t19 < 6U)
        goto LAB58;
    else
        goto LAB56;

LAB58:    t5 = (t2 + t19);
    t11 = (t8 + t19);
    if (*((unsigned char *)t5) != *((unsigned char *)t11))
        goto LAB55;

LAB59:    t19 = (t19 + 1);
    goto LAB57;

LAB60:    t25 = 0;

LAB63:    if (t25 < 6U)
        goto LAB64;
    else
        goto LAB62;

LAB64:    t14 = (t12 + t25);
    t26 = (t24 + t25);
    if (*((unsigned char *)t14) != *((unsigned char *)t26))
        goto LAB61;

LAB65:    t25 = (t25 + 1);
    goto LAB63;

LAB66:    t42 = 0;

LAB69:    if (t42 < 6U)
        goto LAB70;
    else
        goto LAB68;

LAB70:    t29 = (t27 + t42);
    t31 = (t30 + t42);
    if (*((unsigned char *)t29) != *((unsigned char *)t31))
        goto LAB67;

LAB71:    t42 = (t42 + 1);
    goto LAB69;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_4(char *t0)
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

LAB0:    xsi_set_current_line(523, ng0);
    t1 = (t0 + 3536U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB3;

LAB4:
LAB5:    t8 = (t0 + 16880);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 15872);
    *((int *)t13) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 16880);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_5(char *t0)
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

LAB0:    xsi_set_current_line(524, ng0);
    t1 = (t0 + 3376U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB3;

LAB4:
LAB5:    t8 = (t0 + 16944);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 15888);
    *((int *)t13) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 16944);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    unsigned char t21;
    unsigned char t22;
    char *t23;
    unsigned char t24;
    unsigned char t25;
    unsigned char t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(529, ng0);

LAB3:    t1 = (t0 + 6416U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7056U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t5);
    t7 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t3, t6);
    t1 = (t0 + 6416U);
    t8 = *((char **)t1);
    t9 = *((unsigned char *)t8);
    t1 = (t0 + 7056U);
    t10 = *((char **)t1);
    t11 = *((unsigned char *)t10);
    t12 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t9, t11);
    t1 = (t0 + 6256U);
    t13 = *((char **)t1);
    t14 = *((unsigned char *)t13);
    t15 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t12, t14);
    t16 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t7, t15);
    t1 = (t0 + 6416U);
    t17 = *((char **)t1);
    t18 = *((unsigned char *)t17);
    t19 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t18);
    t1 = (t0 + 7056U);
    t20 = *((char **)t1);
    t21 = *((unsigned char *)t20);
    t22 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t19, t21);
    t1 = (t0 + 6256U);
    t23 = *((char **)t1);
    t24 = *((unsigned char *)t23);
    t25 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t24);
    t26 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t22, t25);
    t27 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t16, t26);
    t1 = (t0 + 17008);
    t28 = (t1 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = t27;
    xsi_driver_first_trans_fast(t1);

LAB2:    t32 = (t0 + 15904);
    *((int *)t32) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_7(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    unsigned char t21;
    unsigned char t22;
    char *t23;
    unsigned char t24;
    unsigned char t25;
    unsigned char t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    xsi_set_current_line(533, ng0);

LAB3:    t1 = (t0 + 6576U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7216U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t5);
    t7 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t3, t6);
    t1 = (t0 + 6576U);
    t8 = *((char **)t1);
    t9 = *((unsigned char *)t8);
    t1 = (t0 + 7216U);
    t10 = *((char **)t1);
    t11 = *((unsigned char *)t10);
    t12 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t9, t11);
    t1 = (t0 + 6256U);
    t13 = *((char **)t1);
    t14 = *((unsigned char *)t13);
    t15 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t12, t14);
    t16 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t7, t15);
    t1 = (t0 + 6576U);
    t17 = *((char **)t1);
    t18 = *((unsigned char *)t17);
    t19 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t18);
    t1 = (t0 + 7216U);
    t20 = *((char **)t1);
    t21 = *((unsigned char *)t20);
    t22 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t19, t21);
    t1 = (t0 + 6256U);
    t23 = *((char **)t1);
    t24 = *((unsigned char *)t23);
    t25 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t24);
    t26 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t22, t25);
    t27 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t16, t26);
    t1 = (t0 + 17072);
    t28 = (t1 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    *((unsigned char *)t31) = t27;
    xsi_driver_first_trans_fast(t1);

LAB2:    t32 = (t0 + 15920);
    *((int *)t32) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_8(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(553, ng0);
    t1 = (t0 + 3056U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(557, ng0);
    t1 = (t0 + 17136);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(558, ng0);
    t1 = (t0 + 17200);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB3:    xsi_set_current_line(562, ng0);
    t1 = (t0 + 2896U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    if (t3 != 0)
        goto LAB5;

LAB7:
LAB6:    t1 = (t0 + 15936);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(554, ng0);
    t1 = (t0 + 6736U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t1 = (t0 + 17136);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(555, ng0);
    t1 = (t0 + 6896U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t5 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 17200);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t5;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(563, ng0);
    t1 = (t0 + 17136);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(564, ng0);
    t1 = (t0 + 17200);
    t2 = (t1 + 56U);
    t4 = *((char **)t2);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_9(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(582, ng0);
    t1 = (t0 + 3216U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (!(t3));
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 17264);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 15952);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 17264);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB2;

LAB6:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_10(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    xsi_set_current_line(583, ng0);

LAB3:    t1 = (t0 + 17328);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_11(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(595, ng0);
    t5 = (t0 + 3856U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t8 = (!(t7));
    if (t8 == 1)
        goto LAB14;

LAB15:    t4 = (unsigned char)0;

LAB16:    if (t4 == 1)
        goto LAB11;

LAB12:    t3 = (unsigned char)0;

LAB13:    if (t3 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB20:    t28 = (t0 + 17392);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    *((unsigned char *)t32) = (unsigned char)2;
    xsi_driver_first_trans_fast(t28);

LAB2:    t33 = (t0 + 15968);
    *((int *)t33) = 1;

LAB1:    return;
LAB3:    t5 = (t0 + 17392);
    t24 = (t5 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = (unsigned char)3;
    xsi_driver_first_trans_fast(t5);
    goto LAB2;

LAB5:    t5 = (t0 + 5296U);
    t21 = *((char **)t5);
    t22 = *((unsigned char *)t21);
    t23 = (!(t22));
    t1 = t23;
    goto LAB7;

LAB8:    t5 = (t0 + 3696U);
    t18 = *((char **)t5);
    t19 = *((unsigned char *)t18);
    t20 = (!(t19));
    t2 = t20;
    goto LAB10;

LAB11:    t5 = (t0 + 1936U);
    t13 = *((char **)t5);
    t14 = *((unsigned char *)t13);
    if (t14 == 1)
        goto LAB17;

LAB18:    t5 = (t0 + 2736U);
    t15 = *((char **)t5);
    t16 = *((unsigned char *)t15);
    t17 = (!(t16));
    t12 = t17;

LAB19:    t3 = t12;
    goto LAB13;

LAB14:    t5 = (t0 + 5936U);
    t9 = *((char **)t5);
    t10 = *((unsigned char *)t9);
    t11 = (!(t10));
    t4 = t11;
    goto LAB16;

LAB17:    t12 = (unsigned char)1;
    goto LAB19;

LAB21:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_12(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;

LAB0:    xsi_set_current_line(600, ng0);

LAB3:    t1 = (t0 + 17456);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_13(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(609, ng0);

LAB3:    t1 = (t0 + 9136U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    t1 = (t0 + 17520);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 15984);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_14(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    unsigned char t13;
    char *t14;
    unsigned char t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(610, ng0);

LAB3:    t3 = (t0 + 8976U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    t3 = (t0 + 17584);
    t19 = (t3 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t1;
    xsi_driver_first_trans_fast(t3);

LAB2:    t23 = (t0 + 16000);
    *((int *)t23) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    t3 = (t0 + 3696U);
    t16 = *((char **)t3);
    t17 = *((unsigned char *)t16);
    t18 = (!(t17));
    t1 = t18;
    goto LAB7;

LAB8:    t3 = (t0 + 1936U);
    t9 = *((char **)t3);
    t10 = *((unsigned char *)t9);
    t11 = (!(t10));
    if (t11 == 1)
        goto LAB14;

LAB15:    t8 = (unsigned char)0;

LAB16:    if (t8 == 1)
        goto LAB11;

LAB12:    t3 = (t0 + 3856U);
    t14 = *((char **)t3);
    t15 = *((unsigned char *)t14);
    t7 = t15;

LAB13:    t2 = t7;
    goto LAB10;

LAB11:    t7 = (unsigned char)1;
    goto LAB13;

LAB14:    t3 = (t0 + 2736U);
    t12 = *((char **)t3);
    t13 = *((unsigned char *)t12);
    t8 = t13;
    goto LAB16;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_15(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(614, ng0);

LAB3:    t1 = (t0 + 8976U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    t1 = (t0 + 17648);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_fast(t1);

LAB2:    t9 = (t0 + 16016);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_16(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(618, ng0);

LAB3:    t1 = (t0 + 5456U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 17712);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 16032);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_17(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(619, ng0);

LAB3:    t1 = (t0 + 5616U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 17776);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 16048);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_18(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(621, ng0);

LAB3:    t1 = (t0 + 4976U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 17840);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 16064);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_19(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(622, ng0);

LAB3:    t1 = (t0 + 5136U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 17904);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 16080);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void microblaze_v8_00_b_a_2491771233_3306564128_p_20(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(623, ng0);

LAB3:    t1 = (t0 + 4816U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 17968);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 16096);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void microblaze_v8_00_b_a_2491771233_3306564128_init()
{
	static char *pe[] = {(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_0,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_1,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_2,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_3,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_4,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_5,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_6,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_7,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_8,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_9,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_10,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_11,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_12,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_13,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_14,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_15,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_16,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_17,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_18,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_19,(void *)microblaze_v8_00_b_a_2491771233_3306564128_p_20};
	xsi_register_didat("microblaze_v8_00_b_a_2491771233_3306564128", "isim/isim_system_axisim.sim/microblaze_v8_00_b/a_2491771233_3306564128.didat");
	xsi_register_executes(pe);
}
