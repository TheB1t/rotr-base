class GAR_Ground {
    conditionToAccess = "true";
    
    class VAR_1 {
        displayName = "Наземная техника ВАР";
        vehicles[] = {
            {"Aux501_stat_81mm_plasma_mortar",                  2, "true"},
            {"RD501_warden_tank_field",                         4, "true"},
            {"RD501_fast_infantry_transport_republic",          4, "true"},
            {"RD501_fast_infantry_transport_republic_medic",    4, "true"},
            {"212th_BARC_Sidecar",                              6, "true"},
            {"212th_BARC",                                      8, "true"},
            {"212th_B_APC_Wheeled_aa_cannon_F",                 2, "true"},
            {"212th_B_APC_Wheeled_02_cannon_F",                 4, "true"},
            {"212th_B_APC_Wheeled_fs_cannon_F",                 2, "true"},
            {"3AS_ISP",                                         2, "true"},
            {"3AS_ISP_Transport",                               3, "true"},
            {"3AS_Saber_M1",                                    2, "true"},
            {"3AS_Saber_Super",                                 1, "true"},
            {"3AS_Saber_M1G",                                   1, "true"}
        };

        spawnPoints[] = {
            {"Платформа назмемной техники #1",{"GAR_Ground_1"}}
        };
        
    };
};

class GAR_Air {
    conditionToAccess = "true";
    
    class VAR_2 {
        displayName = "Воздушная техника ВАР";
        vehicles[] = {
            {"Aux501_Vehicles_Republic_Gunships_LAAT_C",        2, "true"},
            {"RD501_LAAT_MKIII_Balls",                          5, "true"},
            {"MTI_arc_170",                                     2, "true"},
            {"3AS_Z95_Yellow",                                  1, "true"},
            {"3AS_Z95_Blue",                                    1, "true"},
            {"3AS_Z95_Republic",                                1, "true"},
            {"MTI_Z95",                                         2, "true"},
            {"3as_V19_base",                                    1, "true"},
            {"MTI_BTLB",                                        2, "true"},
            {"3AS_LAAT_Mk1",                                    2, "true"},
            {"3AS_LAAT_Mk2",                                    2, "true"}
        };

        spawnPoints[] = {
            {"Платформа воздушной техники #1",{"GAR_Air_1"}},
            {"Платформа воздушной техники #2",{"GAR_Air_2"}},
            {"Платформа воздушной техники #3",{"GAR_Air_3"}},
            {"Платформа воздушной техники #4",{"GAR_Air_4"}}
        };
        
    };
};

class CIS_Ground {
    conditionToAccess = "true";
    
    class VAR_3 {
        displayName = "Наземная техника КНС";
        vehicles[] = {
            {"RD501_hailfire_cis_artillery",                    1, "true"},
            {"3AS_AAT_Red",                                     2, "true"},
            {"3AS_AAT",                                         2, "true"},
            {"RD501_light_infantry_transport_CIS_MkII",         4, "true"},
            {"RD501_cis_ast",                                   6, "true"},
            {"O_Truck_03_transport_F",                          2, "true"},
            {"O_Truck_03_ammo_F",                               2, "true"}
        };

        spawnPoints[] = {
            {"Платформа назмемной техники #1",{"CIS_Ground_1"}}
        };
        
    };
};

class CIS_Air {
    conditionToAccess = "true";
    
    class VAR_4 {
        displayName = "Воздушная техника КНС";
        vehicles[] = {
            {"3AS_CIS_Vulture_F",                               4, "true"},
            {"3AS_CIS_Vulture_AA_F",                            4, "true"},
            {"3AS_CIS_Vulture_CAS_F",                           4, "true"},
            {"RD501_HMP_transport",                             2, "true"},
            {"RD501_HMP_gunship",                               2, "true"}
        };

        spawnPoints[] = {
            {"Платформа воздушной техники #1",{"CIS_Air_1"}}
        };
    };
};

class MERC_General {
    conditionToAccess = "true";
    
    class VAR_5 {
        displayName = "Техника Наёмников";
        vehicles[] = {
            {"OPTRE_m1015_mule_fuel_cma",                       100, "true"},
            {"OPTRE_m1015_mule_ammo_cma",                       100, "true"},
            {"OPTRE_M494_CMA",                                  100, "true"},
            {"OPTRE_M875_SPH_CMA",                              100, "true"},
            {"OPTRE_DME_hornet",                                100, "true"},
            {"OPTRE_DME_SOCOM_Pelican",                         100, "true"},
            {"OPTRE_DME_falcon_unarmed",                        100, "true"},
            {"OPTRE_DME_falcon_armed",                          100, "true"},
            {"OPTRE_M914_RV_CMA",                               100, "true"},
            {"OPTRE_M813_TT_CMA",                               100, "true"},
            {"OPTRE_M12R_AA_CMA",                               100, "true"},
            {"OPTRE_M12G1_LRV_CMA",                             100, "true"},
            {"OPTRE_M12A1_LRV_CMA",                             100, "true"},
            {"OPTRE_M12_FAV_CMA",                               100, "true"},
            {"OPTRE_M12_TD_CMA",                                100, "true"},
            {"OPTRE_M12_FAV_APC_MED_CMA",                       100, "true"},
            {"OPTRE_M12_LRV_CMA",                               100, "true"},
            {"OPTRE_M12_FAV_APC_CMA",                           100, "true"}
        };

        spawnPoints[] = {
            {"Платформа техники #1",{"MERC_General_1"}}
        };
    };
};