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
static int ng0[] = {4, 0};
static int ng1[] = {9, 0};
static int ng2[] = {18, 0};
static int ng3[] = {36, 0};
static const char *ng4 = "Attribute Syntax Error : The attribute DATA_WIDTH on FIFO36 instance %m is set to %d.  Legal values for this attribute are 4, 9, 18 or 36.";
static unsigned int ng5[] = {0U, 0U};



static void NetDecl_53_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 6832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 11352);
    t3 = *((char **)t2);
    t4 = ((((char*)(t3))) + 40U);
    t5 = *((char **)t4);
    t4 = (t0 + 8008);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t5 + 4);
    t13 = *((unsigned int *)t5);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t4, 0, 0U);
    t18 = (t0 + 7896);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Initial_61_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    int t5;
    char *t6;
    int t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;

LAB0:
LAB2:    t1 = (t0 + 744);
    t2 = *((char **)t1);

LAB3:    t1 = ((char*)((ng0)));
    t3 = xsi_vlog_signed_case_compare(t2, 32, t1, 32);
    if (t3 == 1)
        goto LAB4;

LAB5:    t4 = ((char*)((ng1)));
    t5 = xsi_vlog_signed_case_compare(t2, 32, t4, 32);
    if (t5 == 1)
        goto LAB6;

LAB7:    t6 = ((char*)((ng2)));
    t7 = xsi_vlog_signed_case_compare(t2, 32, t6, 32);
    if (t7 == 1)
        goto LAB8;

LAB9:    t8 = ((char*)((ng3)));
    t9 = xsi_vlog_signed_case_compare(t2, 32, t8, 32);
    if (t9 == 1)
        goto LAB10;

LAB11:
LAB13:
LAB12:
LAB15:    t10 = (t0 + 744);
    t11 = *((char **)t10);
    xsi_vlogfile_write(1, 0, 0, ng4, 2, t0, (char)119, t11, 32);
    xsi_vlog_finish(1);

LAB14:
LAB1:    return;
LAB4:    goto LAB14;

LAB6:    goto LAB4;

LAB8:    goto LAB4;

LAB10:    goto LAB4;

}

static void implSig1_execute(char *t0)
{
    char t3[16];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 7328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3600U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng5)));
    xsi_vlogtype_concat(t3, 64, 64, 2U, t2, 32, t4, 32);
    t5 = (t0 + 8072);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    xsi_vlog_bit_copy(t9, 0, t3, 0, 64);
    xsi_driver_vfirst_trans(t5, 0, 63);
    t10 = (t0 + 7912);
    *((int *)t10) = 1;

LAB1:    return;
}

static void implSig2_execute(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 7576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 3760U);
    t4 = *((char **)t2);
    t2 = ((char*)((ng5)));
    xsi_vlogtype_concat(t3, 8, 8, 2U, t2, 4, t4, 4);
    t5 = (t0 + 8136);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 255U;
    t11 = t10;
    t12 = (t3 + 4);
    t13 = *((unsigned int *)t3);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 7);
    t18 = (t0 + 7928);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void unisims_ver_m_05419716383049849214_2706989126_init()
{
	static char *pe[] = {(void *)NetDecl_53_0,(void *)Initial_61_1,(void *)implSig1_execute,(void *)implSig2_execute};
	xsi_register_didat("unisims_ver_m_05419716383049849214_2706989126", "isim/isim_system_axisim.sim/unisims_ver/m_05419716383049849214_2706989126.didat");
	xsi_register_executes(pe);
}
