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
static const char *ng0 = "/root/NetFPGA-10G-live/lib/hw/xilinx/pcores/lmb_v10_v1_00_a/hdl/vhdl/lmb_v10.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_3488546069778340532_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768496604610246_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(137, ng0);
    t1 = (1 == 0);
    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (t0 + 5808U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    *((unsigned char *)t2) = t1;

LAB3:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 5808U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (t0 + 9776);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t1;
    xsi_driver_first_trans_fast(t2);
    t2 = (t0 + 9568);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(138, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 5808U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    *((unsigned char *)t2) = t5;
    goto LAB3;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(169, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 9840);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 9584);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(170, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9904);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9600);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(171, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9968);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9616);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(172, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10032);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9632);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(173, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 10096);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 9648);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(174, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 10160);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 9664);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_7(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(182, ng0);
    t1 = (t0 + 5928U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(183, ng0);
    t1 = (t0 + 16580);
    *((int *)t1) = 0;
    t2 = (t0 + 16584);
    *((int *)t2) = 0;
    t3 = 0;
    t4 = 0;

LAB2:    if (t3 <= t4)
        goto LAB3;

LAB5:    xsi_set_current_line(186, ng0);
    t1 = (t0 + 5928U);
    t2 = *((char **)t1);
    t7 = *((unsigned char *)t2);
    t1 = (t0 + 10224);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t14 = *((char **)t8);
    *((unsigned char *)t14) = t7;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 9680);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(184, ng0);
    t5 = (t0 + 5928U);
    t6 = *((char **)t5);
    t7 = *((unsigned char *)t6);
    t5 = (t0 + 2632U);
    t8 = *((char **)t5);
    t5 = (t0 + 16580);
    t9 = *((int *)t5);
    t10 = (t9 - 0);
    t11 = (t10 * 1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t14 = (t8 + t13);
    t15 = *((unsigned char *)t14);
    t16 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t7, t15);
    t17 = (t0 + 5928U);
    t18 = *((char **)t17);
    t17 = (t18 + 0);
    *((unsigned char *)t17) = t16;

LAB4:    t1 = (t0 + 16580);
    t3 = *((int *)t1);
    t2 = (t0 + 16584);
    t4 = *((int *)t2);
    if (t3 == t4)
        goto LAB5;

LAB6:    t9 = (t3 + 1);
    t3 = t9;
    t5 = (t0 + 16580);
    *((int *)t5) = t3;
    goto LAB2;

}

static void lmb_v10_v1_00_a_a_0155351019_3306564128_p_8(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    int t10;
    int t11;
    int t12;
    int t13;
    int t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    int t22;
    int t23;
    char *t24;
    int t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned char t32;
    unsigned char t33;
    char *t34;
    char *t35;
    int t36;
    int t37;
    char *t38;
    int t39;
    int t40;
    int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;

LAB0:    xsi_set_current_line(194, ng0);
    t1 = (1 == 1);
    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(198, ng0);
    t8 = (1 - 1);
    t2 = (t0 + 16588);
    *((int *)t2) = 0;
    t3 = (t0 + 16592);
    *((int *)t3) = t8;
    t9 = 0;
    t10 = t8;

LAB5:    if (t9 <= t10)
        goto LAB6;

LAB8:    xsi_set_current_line(204, ng0);
    t8 = (32 - 1);
    t2 = (t0 + 16604);
    *((int *)t2) = 0;
    t3 = (t0 + 16608);
    *((int *)t3) = t8;
    t9 = 0;
    t10 = t8;

LAB15:    if (t9 <= t10)
        goto LAB16;

LAB18:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 6048U);
    t3 = *((char **)t2);
    t2 = (t0 + 10288);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);

LAB3:    t2 = (t0 + 9696);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(195, ng0);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 10288);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB3;

LAB6:    xsi_set_current_line(199, ng0);
    t11 = (32 - 1);
    t4 = (t0 + 16596);
    *((int *)t4) = 0;
    t5 = (t0 + 16600);
    *((int *)t5) = t11;
    t12 = 0;
    t13 = t11;

LAB9:    if (t12 <= t13)
        goto LAB10;

LAB12:
LAB7:    t2 = (t0 + 16588);
    t9 = *((int *)t2);
    t3 = (t0 + 16592);
    t10 = *((int *)t3);
    if (t9 == t10)
        goto LAB8;

LAB14:    t8 = (t9 + 1);
    t9 = t8;
    t4 = (t0 + 16588);
    *((int *)t4) = t9;
    goto LAB5;

LAB10:    xsi_set_current_line(200, ng0);
    t6 = (t0 + 2632U);
    t7 = *((char **)t6);
    t6 = (t0 + 16588);
    t14 = *((int *)t6);
    t15 = (t14 - 0);
    t16 = (t15 * 1);
    xsi_vhdl_check_range_of_index(0, 0, 1, *((int *)t6));
    t17 = (1U * t16);
    t18 = (0 + t17);
    t19 = (t7 + t18);
    t1 = *((unsigned char *)t19);
    t20 = (t0 + 2472U);
    t21 = *((char **)t20);
    t20 = (t0 + 16588);
    t22 = *((int *)t20);
    t23 = (t22 * 32);
    t24 = (t0 + 16596);
    t25 = *((int *)t24);
    t26 = (t23 + t25);
    t27 = (t26 - 0);
    t28 = (t27 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t26);
    t29 = (1U * t28);
    t30 = (0 + t29);
    t31 = (t21 + t30);
    t32 = *((unsigned char *)t31);
    t33 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t1, t32);
    t34 = (t0 + 6168U);
    t35 = *((char **)t34);
    t34 = (t0 + 16588);
    t36 = *((int *)t34);
    t37 = (t36 * 32);
    t38 = (t0 + 16596);
    t39 = *((int *)t38);
    t40 = (t37 + t39);
    t41 = (t40 - 0);
    t42 = (t41 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t40);
    t43 = (1U * t42);
    t44 = (0 + t43);
    t45 = (t35 + t44);
    *((unsigned char *)t45) = t33;

LAB11:    t2 = (t0 + 16596);
    t12 = *((int *)t2);
    t3 = (t0 + 16600);
    t13 = *((int *)t3);
    if (t12 == t13)
        goto LAB12;

LAB13:    t8 = (t12 + 1);
    t12 = t8;
    t4 = (t0 + 16596);
    *((int *)t4) = t12;
    goto LAB9;

LAB16:    xsi_set_current_line(205, ng0);
    t4 = (t0 + 6288U);
    t5 = *((char **)t4);
    t4 = (t5 + 0);
    *((unsigned char *)t4) = (unsigned char)2;
    xsi_set_current_line(206, ng0);
    t8 = (1 - 1);
    t2 = (t0 + 16612);
    *((int *)t2) = 0;
    t3 = (t0 + 16616);
    *((int *)t3) = t8;
    t11 = 0;
    t12 = t8;

LAB19:    if (t11 <= t12)
        goto LAB20;

LAB22:    xsi_set_current_line(209, ng0);
    t2 = (t0 + 6288U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t2 = (t0 + 6048U);
    t4 = *((char **)t2);
    t2 = (t0 + 16604);
    t8 = *((int *)t2);
    t11 = (t8 - 0);
    t16 = (t11 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, *((int *)t2));
    t17 = (1U * t16);
    t18 = (0 + t17);
    t5 = (t4 + t18);
    *((unsigned char *)t5) = t1;

LAB17:    t2 = (t0 + 16604);
    t9 = *((int *)t2);
    t3 = (t0 + 16608);
    t10 = *((int *)t3);
    if (t9 == t10)
        goto LAB18;

LAB24:    t8 = (t9 + 1);
    t9 = t8;
    t4 = (t0 + 16604);
    *((int *)t4) = t9;
    goto LAB15;

LAB20:    xsi_set_current_line(207, ng0);
    t4 = (t0 + 6288U);
    t5 = *((char **)t4);
    t1 = *((unsigned char *)t5);
    t4 = (t0 + 6168U);
    t6 = *((char **)t4);
    t4 = (t0 + 16612);
    t13 = *((int *)t4);
    t14 = (t13 * 32);
    t7 = (t0 + 16604);
    t15 = *((int *)t7);
    t22 = (t14 + t15);
    t23 = (t22 - 0);
    t16 = (t23 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t22);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t19 = (t6 + t18);
    t32 = *((unsigned char *)t19);
    t33 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t1, t32);
    t20 = (t0 + 6288U);
    t21 = *((char **)t20);
    t20 = (t21 + 0);
    *((unsigned char *)t20) = t33;

LAB21:    t2 = (t0 + 16612);
    t11 = *((int *)t2);
    t3 = (t0 + 16616);
    t12 = *((int *)t3);
    if (t11 == t12)
        goto LAB22;

LAB23:    t8 = (t11 + 1);
    t11 = t8;
    t4 = (t0 + 16612);
    *((int *)t4) = t11;
    goto LAB19;

}


extern void lmb_v10_v1_00_a_a_0155351019_3306564128_init()
{
	static char *pe[] = {(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_0,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_1,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_2,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_3,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_4,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_5,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_6,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_7,(void *)lmb_v10_v1_00_a_a_0155351019_3306564128_p_8};
	xsi_register_didat("lmb_v10_v1_00_a_a_0155351019_3306564128", "isim/isim_system_axisim.sim/lmb_v10_v1_00_a/a_0155351019_3306564128.didat");
	xsi_register_executes(pe);
}
