class GAR_Ground {
    conditionToAccess = "true";
    
    class VAR_1 {
        displayName = "Наземная техника ВАР";
        vehicles[] = {
            {"Aux501_stat_81mm_plasma_mortar",                  2, "true"},
            {"RD501_warden_tank_field",                         4, "true"},
            {"RD501_fast_infantry_transport_republic",          4, "true"},
            {"RD501_fast_infantry_transport_republic_medic",    4, "true"},
            {"3as_Barc",                                        16, "true"},
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
            {"3AS_LAATC",                                       2, "true"},
            {"RD501_LAAT_MKIII_Balls",                          5, "true"},
            {"MTI_arc_170",                                     2, "true"},
            {"3AS_Z95_Yellow",                                  1, "true"},
            {"3AS_Z95_Blue",                                    1, "true"},
            {"3AS_Z95_Republic",                                1, "true"},
            {"MTI_Z95",                                         2, "true"},
            {"3as_V19_base",                                    1, "true"},
            {"MTI_BTLB",                                        2, "true"},
            {"3AS_LAAT_Mk1",                                    2, "true"},
            {"MTI_Delta7_Base",                                 10, "true"},
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
            {"OPTRE_M412_IFV_UNSC",                             -1, "true"},
            {"OPTRE_M413_MGS_UNSC",                             -1, "true"},
            {"OPTRE_UNSC_hornet",                               -1, "true"},
            {"OPTRE_AV22C_Sparrowhawk",                         -1, "true"},
            {"OPTRE_AV22A_Sparrowhawk",                         -1, "true"},
            {"OPTRE_AV22_Sparrowhawk",                          -1, "true"},
            {"OPTRA_AV22B_Sparrowhawk",                         -1, "true"},
            {"OPTRE_Pelican_armed",                             -1, "true"},
            {"OPTRE_UNSC_Falcon_armed",                         -1, "true"},
            {"OPTRE_M12_FAV",                                   -1, "true"},
            {"OPTRE_M813_TT",                                   -1, "true"},
            {"OPTRE_m1087_stallion_covered_unsc",               -1, "true"},
            {"OPTRE_M12_FAV_APC",                               -1, "true"},
            {"OPTRE_M12A1_LRV",                                 -1, "true"},
            {"OPTRE_M12G1_LRV",                                 -1, "true"},
            {"OPTRE_M12R_AA",                                   -1, "true"},
            {"OPTRE_cart",                                      -1, "true"},
            {"OPTRE_YSS_-1_A_VTOL",                             -1, "true"},
            {"OPTRE_M808B_UNSC",                                -1, "true"},
            {"OPTRE_M808BM_UNSC",                               -1, "true"},
            {"OPTRE_M808B2",                                    -1, "true"},
            {"OPTRE_M808S",                                     -1, "true"},
            {"OPTRE_M850_UNSC",                                 -1, "true"},
            {"OPTRE_M494",                                      -1, "true"},
            {"RD501_warden_tank_field",                         -1, "true"},
            {"RD501_arc_170_blue",                              -1, "true"},
            {"RD501_fast_infantry_transport_republic",          -1, "true"},
            {"RD501_LAAT_MKIII_Balls",                          -1, "true"},
            {"442_laat_2",                                      -1, "true"},
            {"3as_LAAT_Mk2",                                    -1, "true"},
            {"3AS_LAATC_Wampa",                                 -1, "true"},
            {"3as_Z95_Republic",                                -1, "true"},
            {"3as_arc_170_blue",                                -1, "true"},
            {"3as_Barc",                                        -1, "true"}
        };

        spawnPoints[] = {
            {"Платформа техники #1",{"MERC_General_1"}}
        };
    };
};