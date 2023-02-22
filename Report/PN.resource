 
****************************************
Report : resources
Design : PN
Version: N-2017.09-SP2
Date   : Thu Jul 28 11:06:29 2022
****************************************


Resource Report for Ungrouped Hierarchy M2 in file DESIGN_MODULE.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_1        | DW01_sub       | width=32   | sub_230 (DESIGN_MODULE.v:230) |
| add_x_13       | DW01_inc       | width=4    | add_331 (DESIGN_MODULE.v:331) |
| sub_x_14       | DW01_dec       | width=4    | sub_334 (DESIGN_MODULE.v:334) |
| lt_x_17        | DW_cmp         | width=5    | lt_368 (DESIGN_MODULE.v:368) |
| lt_x_18        | DW_cmp         | width=5    | lt_368_I2 (DESIGN_MODULE.v:368) |
| lt_x_19        | DW_cmp         | width=5    | lt_368_I3 (DESIGN_MODULE.v:368) |
| lt_x_20        | DW_cmp         | width=5    | lt_368_I4 (DESIGN_MODULE.v:368) |
| lt_x_21        | DW_cmp         | width=5    | lt_368_I5 (DESIGN_MODULE.v:368) |
| lt_x_22        | DW_cmp         | width=5    | lt_368_I6 (DESIGN_MODULE.v:368) |
| lt_x_23        | DW_cmp         | width=5    | lt_368_I7 (DESIGN_MODULE.v:368) |
| lt_x_24        | DW_cmp         | width=5    | lt_368_I8 (DESIGN_MODULE.v:368) |
| lt_x_25        | DW_cmp         | width=5    | lt_368_I9 (DESIGN_MODULE.v:368) |
| lt_x_26        | DW_cmp         | width=5    | lt_368_I10 (DESIGN_MODULE.v:368) |
| lt_x_27        | DW_cmp         | width=5    | lt_368_I11 (DESIGN_MODULE.v:368) |
| lt_x_28        | DW_cmp         | width=5    | lt_368_I12 (DESIGN_MODULE.v:368) |
| lt_x_30        | DW_cmp         | width=5    | lt_368_I14 (DESIGN_MODULE.v:368) |
| lt_x_31        | DW_cmp         | width=5    | lt_368_I15 (DESIGN_MODULE.v:368) |
| lt_x_32        | DW_cmp         | width=5    | lt_368_I16 (DESIGN_MODULE.v:368) |
| lt_x_33        | DW_cmp         | width=5    | lt_368_I17 (DESIGN_MODULE.v:368) |
| gt_x_34        | DW_cmp         | width=5    | gt_377 (DESIGN_MODULE.v:377) |
| gt_x_35        | DW_cmp         | width=5    | gt_377_I2 (DESIGN_MODULE.v:377) |
| gt_x_36        | DW_cmp         | width=5    | gt_377_I3 (DESIGN_MODULE.v:377) |
| gt_x_37        | DW_cmp         | width=5    | gt_377_I4 (DESIGN_MODULE.v:377) |
| gt_x_38        | DW_cmp         | width=5    | gt_377_I5 (DESIGN_MODULE.v:377) |
| gt_x_39        | DW_cmp         | width=5    | gt_377_I6 (DESIGN_MODULE.v:377) |
| gt_x_40        | DW_cmp         | width=5    | gt_377_I7 (DESIGN_MODULE.v:377) |
| gt_x_41        | DW_cmp         | width=5    | gt_377_I8 (DESIGN_MODULE.v:377) |
| gt_x_42        | DW_cmp         | width=5    | gt_377_I9 (DESIGN_MODULE.v:377) |
| gt_x_43        | DW_cmp         | width=5    | gt_377_I10 (DESIGN_MODULE.v:377) |
| gt_x_44        | DW_cmp         | width=5    | gt_377_I11 (DESIGN_MODULE.v:377) |
| gt_x_45        | DW_cmp         | width=5    | gt_377_I12 (DESIGN_MODULE.v:377) |
| gt_x_46        | DW_cmp         | width=5    | gt_377_I13 (DESIGN_MODULE.v:377) |
| gt_x_47        | DW_cmp         | width=5    | gt_377_I14 (DESIGN_MODULE.v:377) |
| gt_x_48        | DW_cmp         | width=5    | gt_377_I15 (DESIGN_MODULE.v:377) |
| sub_x_119      | DW01_sub       | width=5    | sub_399 (DESIGN_MODULE.v:399) |
| mult_x_126     | DW02_mult      | A_width=32 | mult_424 (DESIGN_MODULE.v:424) |
             |                | B_width=32 |                            |
| gte_x_127      | DW_cmp         | width=32   | gte_425 (DESIGN_MODULE.v:425) |
| sub_x_8        | DW01_dec       | width=5    | sub_313 (DESIGN_MODULE.v:313) |
              |                |            | sub_316 (DESIGN_MODULE.v:316) |
              |                |            | sub_414 (DESIGN_MODULE.v:414) |
| add_x_7        | DW01_inc       | width=5    | add_310 (DESIGN_MODULE.v:310) |
              |                |            | add_316 (DESIGN_MODULE.v:316) |
| DP_OP_903J1_122_6876            |            |                            |
|                | DP_OP_903J1_122_6876 |      |                            |
=============================================================================

Datapath Report for DP_OP_903J1_122_6876
==============================================================================
| Cell                 | Contained Operations                                |
==============================================================================
| DP_OP_903J1_122_6876 | add_229 (DESIGN_MODULE.v:229)                       |
|                      | sub_mult_425 (DESIGN_MODULE.v:425)                  |
==============================================================================

==============================================================================
|       |      | Data     |       |                                          |
| Var   | Type | Class    | Width | Expression                               |
==============================================================================
| I1    | PI   | Signed   | 32    |                                          |
| I2    | PI   | Signed   | 32    |                                          |
| O1    | PO   | Unsigned | 32    | I1 + I2 (DESIGN_MODULE.v:229)            |
| O2    | PO   | Signed   | 32    | $signed(1'b0) - O1 (DESIGN_MODULE.v:425) |
==============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| sub_x_1            | DW01_sub         | pparch (area,speed)                 |
| add_x_13           | DW01_inc         | apparch (area)     |                |
| sub_x_14           | DW01_dec         | apparch (area)     |                |
| lt_x_17            | DW_cmp           | apparch (area)     |                |
| lt_x_18            | DW_cmp           | apparch (area)     |                |
| lt_x_19            | DW_cmp           | apparch (area)     |                |
| lt_x_20            | DW_cmp           | apparch (area)     |                |
| lt_x_21            | DW_cmp           | apparch (area)     |                |
| lt_x_22            | DW_cmp           | apparch (area)     |                |
| lt_x_23            | DW_cmp           | apparch (area)     |                |
| lt_x_24            | DW_cmp           | apparch (area)     |                |
| lt_x_25            | DW_cmp           | apparch (area)     |                |
| lt_x_26            | DW_cmp           | apparch (area)     |                |
| lt_x_27            | DW_cmp           | apparch (area)     |                |
| lt_x_28            | DW_cmp           | apparch (area)     |                |
| lt_x_30            | DW_cmp           | apparch (area)     |                |
| lt_x_31            | DW_cmp           | apparch (area)     |                |
| lt_x_32            | DW_cmp           | apparch (area)     |                |
| lt_x_33            | DW_cmp           | apparch (area)     |                |
| gt_x_34            | DW_cmp           | apparch (area)     |                |
| gt_x_35            | DW_cmp           | apparch (area)     |                |
| gt_x_36            | DW_cmp           | apparch (area)     |                |
| gt_x_37            | DW_cmp           | apparch (area)     |                |
| gt_x_38            | DW_cmp           | apparch (area)     |                |
| gt_x_39            | DW_cmp           | apparch (area)     |                |
| gt_x_40            | DW_cmp           | apparch (area)     |                |
| gt_x_41            | DW_cmp           | apparch (area)     |                |
| gt_x_42            | DW_cmp           | apparch (area)     |                |
| gt_x_43            | DW_cmp           | apparch (area)     |                |
| gt_x_44            | DW_cmp           | apparch (area)     |                |
| gt_x_45            | DW_cmp           | apparch (area)     |                |
| gt_x_46            | DW_cmp           | apparch (area)     |                |
| gt_x_47            | DW_cmp           | apparch (area)     |                |
| gt_x_48            | DW_cmp           | apparch (area)     |                |
| sub_x_119          | DW01_sub         | apparch (area)     |                |
| mult_x_126         | DW02_mult        | pparch (area,speed)                 |
|                    |                  | mult_arch: benc_radix8              |
| gte_x_127          | DW_cmp           | apparch (area)     |                |
| sub_x_8            | DW01_dec         | apparch (area)     |                |
| add_x_7            | DW01_inc         | apparch (area)     |                |
| DP_OP_903J1_122_6876                  |                    |                |
|                    | DP_OP_903J1_122_6876 | str (area,speed)                |
===============================================================================

1
