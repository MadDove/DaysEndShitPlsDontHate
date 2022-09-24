EADAY = EADAY or {}
local template = {
    fullType = "EADAY.",
    name = "",
    north = {
        sprite = "",
        openSprite = ""
    },
    west = {
        sprite = "",
        openSprite = ""
    }
}
EADAY.DoorConfigs = {
    {
        fullType = "EADAY.CarpentryDoor1",
        name = "Self made door (poor)",
        north = {
            sprite = "carpentry_01_49",
            openSprite = "carpentry_01_51"
        },
        west = {
            sprite = "carpentry_01_48",
            openSprite = "carpentry_01_50"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.CarpentryDoor2",
        name = "Self made door (average)",
        north = {
            sprite = "carpentry_01_53",
            openSprite = "carpentry_01_55"
        },
        west = {
            sprite = "carpentry_01_52",
            openSprite = "carpentry_01_54"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.CarpentryDoor3",
        name = "Self made door (excellent)",
        north = {
            sprite = "carpentry_01_57",
            openSprite = "carpentry_01_59"
        },
        west = {
            sprite = "carpentry_01_56",
            openSprite = "carpentry_01_58"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.CellDoor",
        name = "Cell door",
        north = {
            sprite = "location_community_police_01_5",
            openSprite = "location_community_police_01_7"
        },
        west = {
            sprite = "location_community_police_01_4",
            openSprite = "location_community_police_01_6"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ChurchDoor_Blue_Left",
        name = "Church door (blue) left",
        north = {
            sprite = "location_community_church_small_01_29",
            openSprite = "location_community_church_small_01_31"
        },
        west = {
            sprite = "location_community_church_small_01_28",
            openSprite = "location_community_church_small_01_30"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ChurchDoor_Blue_Right",
        name = "Church door (blue) right",
        north = {
            sprite = "location_community_church_small_01_25",
            openSprite = "location_community_church_small_01_27"
        },
        west = {
            sprite = "location_community_church_small_01_24",
            openSprite = "location_community_church_small_01_26"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ChurchDoor_Walnut_Left",
        name = "Church door (walnut) left",
        north = {
            sprite = "location_community_church_small_01_65",
            openSprite = "location_community_church_small_01_67"
        },
        west = {
            sprite = "location_community_church_small_01_64",
            openSprite = "location_community_church_small_01_66"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ChurchDoor_Walnut_Right",
        name = "Church door (walnut) right",
        north = {
            sprite = "location_community_church_small_01_69",
            openSprite = "location_community_church_small_01_71"
        },
        west = {
            sprite = "location_community_church_small_01_68",
            openSprite = "location_community_church_small_01_70"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ClassroomDoor_Ebony",
        name = "Classroom door (ebony)",
        north = {
            sprite = "fixtures_doors_01_21",
            openSprite = "fixtures_doors_01_23"
        },
        west = {
            sprite = "fixtures_doors_01_20",
            openSprite = "fixtures_doors_01_22"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ClassroomDoor_Pine",
        name = "Classroom door (pine)",
        north = {
            sprite = "fixtures_doors_01_17",
            openSprite = "fixtures_doors_01_19"
        },
        west = {
            sprite = "fixtures_doors_01_16",
            openSprite = "fixtures_doors_01_18"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.Door_Blue",
        name = "Blue door",
        north = {
            sprite = "fixtures_doors_02_1",
            openSprite = "fixtures_doors_02_3"
        },
        west = {
            sprite = "fixtures_doors_02_0",
            openSprite = "fixtures_doors_02_2"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.Door_Walnut",
        name = "Walnut door",
        north = {
            sprite = "fixtures_doors_01_5",
            openSprite = "fixtures_doors_01_7"
        },
        west = {
            sprite = "fixtures_doors_01_4",
            openSprite = "fixtures_doors_01_6"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.Door_Mahogany",
        name = "Mahogany door",
        north = {
            sprite = "fixtures_doors_01_13",
            openSprite = "fixtures_doors_01_15"
        },
        west = {
            sprite = "fixtures_doors_01_12",
            openSprite = "fixtures_doors_01_14"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.Door_White",
        name = "White door",
        north = {
            sprite = "fixtures_doors_01_1",
            openSprite = "fixtures_doors_01_3"
        },
        west = {
            sprite = "fixtures_doors_01_0",
            openSprite = "fixtures_doors_01_2"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.DoorWithWindow_Walnut",
        name = "Walnut door with window",
        north = {
            sprite = "fixtures_doors_02_5",
            openSprite = "fixtures_doors_02_7"
        },
        west = {
            sprite = "fixtures_doors_02_4",
            openSprite = "fixtures_doors_02_6"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.DoorWithWindow_White",
        name = "White door with window",
        north = {
            sprite = "fixtures_doors_01_45",
            openSprite = "fixtures_doors_01_47"
        },
        west = {
            sprite = "fixtures_doors_01_44",
            openSprite = "fixtures_doors_01_46"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.FittingRoomDoor_Beige",
        name = "Fitting room door (beige)",
        north = {
            sprite = "fixtures_doors_02_21",
            openSprite = "fixtures_doors_02_23"
        },
        west = {
            sprite = "fixtures_doors_02_20",
            openSprite = "fixtures_doors_02_22"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.FittingRoomDoor_Brown",
        name = "Fitting room door (brown)",
        north = {
            sprite = "fixtures_doors_02_17",
            openSprite = "fixtures_doors_02_19"
        },
        west = {
            sprite = "fixtures_doors_02_16",
            openSprite = "fixtures_doors_02_18"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.FittingRoomDoor_Graphite",
        name = "Fitting room door (graphite)",
        north = {
            sprite = "fixtures_doors_02_25",
            openSprite = "fixtures_doors_02_27"
        },
        west = {
            sprite = "fixtures_doors_02_24",
            openSprite = "fixtures_doors_02_26"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.GlassDoor_EbonyFrame",
        name = "Glass door (ebony frame)",
        north = {
            sprite = "fixtures_doors_01_41",
            openSprite = "fixtures_doors_01_43"
        },
        west = {
            sprite = "fixtures_doors_01_40",
            openSprite = "fixtures_doors_01_42"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.GlassDoor_MahoganyFrame",
        name = "Glass door (mahogany frame)",
        north = {
            sprite = "fixtures_doors_01_37",
            openSprite = "fixtures_doors_01_39"
        },
        west = {
            sprite = "fixtures_doors_01_36",
            openSprite = "fixtures_doors_01_38"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.LargeWicket_ElaborateMetal2",
        name = "Large elaborate metal wicket",
        north = {
            sprite = "fixtures_doors_fences_01_21",
            openSprite = "fixtures_doors_fences_01_23"
        },
        west = {
            sprite = "fixtures_doors_fences_01_20",
            openSprite = "fixtures_doors_fences_01_22"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.MetalDoor_Brass",
        name = "Metal door (brass)",
        north = {
            sprite = "fixtures_doors_01_65",
            openSprite = "fixtures_doors_01_67"
        },
        west = {
            sprite = "fixtures_doors_01_64",
            openSprite = "fixtures_doors_01_66"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.MetalDoor_Bronze",
        name = "Metal door (bronze)",
        north = {
            sprite = "fixtures_doors_01_57",
            openSprite = "fixtures_doors_01_59"
        },
        west = {
            sprite = "fixtures_doors_01_56",
            openSprite = "fixtures_doors_01_58"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.MetalDoor_Grey_Left",
        name = "Metal door (grey) left",
        north = {
            sprite = "fixtures_doors_02_49",
            openSprite = "fixtures_doors_02_51"
        },
        west = {
            sprite = "fixtures_doors_02_48",
            openSprite = "fixtures_doors_02_50"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.MetalDoor_Grey_Right",
        name = "Metal door (grey) right",
        north = {
            sprite = "fixtures_doors_02_53",
            openSprite = "fixtures_doors_02_55"
        },
        west = {
            sprite = "fixtures_doors_02_52",
            openSprite = "fixtures_doors_02_54"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.MetalDoor_Steel",
        name = "Metal door (steel)",
        north = {
            sprite = "fixtures_doors_01_53",
            openSprite = "fixtures_doors_01_55"
        },
        west = {
            sprite = "fixtures_doors_01_52",
            openSprite = "fixtures_doors_01_54"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PileOCrepeDoor_Blue",
        name = "Pile O Crepe door (blue)",
        north = {
            sprite = "location_restaurant_pileocrepe_01_49",
            openSprite = "location_restaurant_pileocrepe_01_51"
        },
        west = {
            sprite = "location_restaurant_pileocrepe_01_48",
            openSprite = "location_restaurant_pileocrepe_01_50"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoor_Blue",
        name = "Push door (blue)",
        north = {
            sprite = "fixtures_doors_01_25",
            openSprite = "fixtures_doors_01_27"
        },
        west = {
            sprite = "fixtures_doors_01_24",
            openSprite = "fixtures_doors_01_26"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoor_Graphite",
        name = "Push door (graphite)",
        north = {
            sprite = "fixtures_doors_02_13",
            openSprite = "fixtures_doors_02_15"
        },
        west = {
            sprite = "fixtures_doors_02_12",
            openSprite = "fixtures_doors_02_14"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoor_Green",
        name = "Push door (green)",
        north = {
            sprite = "location_restaurant_pizzawhirled_01_61",
            openSprite = "location_restaurant_pizzawhirled_01_63"
        },
        west = {
            sprite = "location_restaurant_pizzawhirled_01_60",
            openSprite = "location_restaurant_pizzawhirled_01_62"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoor_Orange",
        name = "Push door (orange)",
        north = {
            sprite = "location_restaurant_pileocrepe_01_53",
            openSprite = "location_restaurant_pileocrepe_01_55"
        },
        west = {
            sprite = "location_restaurant_pileocrepe_01_52",
            openSprite = "location_restaurant_pileocrepe_01_54"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoor_Reddish",
        name = "Push door (reddish)",
        north = {
            sprite = "fixtures_doors_02_9",
            openSprite = "fixtures_doors_02_11"
        },
        west = {
            sprite = "fixtures_doors_02_8",
            openSprite = "fixtures_doors_02_10"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoor_Spiffos",
        name = "Push door (Spiffos)",
        north = {
            sprite = "location_restaurant_spiffos_01_53",
            openSprite = "location_restaurant_spiffos_01_55"
        },
        west = {
            sprite = "location_restaurant_spiffos_01_52",
            openSprite = "location_restaurant_spiffos_01_54"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoorWithWindow",
        name = "Push door with window",
        north = {
            sprite = "fixtures_doors_01_61",
            openSprite = "fixtures_doors_01_63"
        },
        west = {
            sprite = "fixtures_doors_01_60",
            openSprite = "fixtures_doors_01_62"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoorWithWindow_Pine_Left",
        name = "Push door with window (pine) left",
        north = {
            sprite = "fixtures_doors_02_57",
            openSprite = "fixtures_doors_02_59"
        },
        west = {
            sprite = "fixtures_doors_02_56",
            openSprite = "fixtures_doors_02_58"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.PushDoorWithWindow_Pine_Right",
        name = "Push door with window (pine) right",
        north = {
            sprite = "fixtures_doors_02_61",
            openSprite = "fixtures_doors_02_63"
        },
        west = {
            sprite = "fixtures_doors_02_60",
            openSprite = "fixtures_doors_02_62"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SecurityDoor",
        name = "Security door",
        north = {
            sprite = "fixtures_doors_01_33",
            openSprite = "fixtures_doors_01_35"
        },
        west = {
            sprite = "fixtures_doors_01_32",
            openSprite = "fixtures_doors_01_34"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        name = "Shed door",
        fullType = "EADAY.ShedDoor",
        north = {
            sprite = "fixtures_doors_01_29",
            openSprite = "fixtures_doors_01_31"
        },
        west = {
            sprite = "fixtures_doors_01_28",
            openSprite = "fixtures_doors_01_30"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SlideGlassDoor_MahoganyFrame",
        name = "Slide glass door (mahogany frame)",
        north = {
            sprite = "",
            openSprite = ""
        },
        west = {
            sprite = "",
            openSprite = ""
        },
        requires = {}
    },
    {
        fullType = "EADAY.SlideGlassDoor_AluFrame",
        name = "Slide glass door (alu frame)",
        north = {
            sprite = "fixtures_doors_01_117",
            openSprite = "fixtures_doors_01_119"
        },
        west = {
            sprite = "fixtures_doors_01_116",
            openSprite = "fixtures_doors_01_118"
        },
        requires = {}
    },
    {
        fullType = "EADAY.SmallWicket_ElaborateMetal",
        name = "Small elaborate metal wicket",
        north = {
            sprite = "fixtures_doors_fences_01_1",
            openSprite = "fixtures_doors_fences_01_3"
        },
        west = {
            sprite = "fixtures_doors_fences_01_0",
            openSprite = "fixtures_doors_fences_01_2"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SmallWicket_MetalMesh",
        name = "Small metal mesh wicket",
        north = {
            sprite = "fixtures_doors_fences_01_17",
            openSprite = "fixtures_doors_fences_01_19"
        },
        west = {
            sprite = "fixtures_doors_fences_01_16",
            openSprite = "fixtures_doors_fences_01_18"
        },
        disabled = false,
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SmallWicket_Wooden",
        name = "Small wooden wicket",
        north = {
            sprite = "fixtures_doors_fences_01_5",
            openSprite = "fixtures_doors_fences_01_7"
        },
        west = {
            sprite = "fixtures_doors_fences_01_4",
            openSprite = "fixtures_doors_fences_01_6"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SplitGlassDoor_EbonyFrame",
        name = "Split glass door (ebony frame)",
        north = {
            sprite = "fixtures_doors_01_49",
            openSprite = "fixtures_doors_01_51"
        },
        west = {
            sprite = "fixtures_doors_01_48",
            openSprite = "fixtures_doors_01_50"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SplitGlassDoor_Fossoil",
        name = "Split glass door (Fossoil)",
        north = {
            sprite = "location_shop_fossoil_01_61",
            openSprite = "location_shop_fossoil_01_63"
        },
        west = {
            sprite = "location_shop_fossoil_01_60",
            openSprite = "location_shop_fossoil_01_62"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SplitGlassDoor_Gas2Go",
        name = "Split glass door (Gas2Go)",
        north = {
            sprite = "location_shop_gas2go_01_61",
            openSprite = "location_shop_gas2go_01_63"
        },
        west = {
            sprite = "location_shop_gas2go_01_60",
            openSprite = "location_shop_gas2go_01_62"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SplitGlassDoor_GraphiteFrame_Left",
        name = "Split glass door (graphite frame) left",
        north = {
            sprite = "fixtures_doors_02_41",
            openSprite = "fixtures_doors_02_43"
        },
        west = {
            sprite = "fixtures_doors_02_40",
            openSprite = "fixtures_doors_02_42"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SplitGlassDoor_GraphiteFrame_Right",
        name = "Split glass door (graphite frame) right",
        north = {
            sprite = "fixtures_doors_02_45",
            openSprite = "fixtures_doors_02_47"
        },
        west = {
            sprite = "fixtures_doors_02_44",
            openSprite = "fixtures_doors_02_46"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SplitGlassDoor_PizzaWhirled",
        name = "Split glass door (Pizza Whirled)",
        north = {
            sprite = "location_restaurant_pizzawhirled_01_57",
            openSprite = "location_restaurant_pizzawhirled_01_59"
        },
        west = {
            sprite = "location_restaurant_pizzawhirled_01_56",
            openSprite = "location_restaurant_pizzawhirled_01_58"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.SplitGlassDoor_Spiffos",
        name = "Split glass door (Spiffos)",
        north = {
            sprite = "location_restaurant_spiffos_01_49",
            openSprite = "location_restaurant_spiffos_01_51"
        },
        west = {
            sprite = "location_restaurant_spiffos_01_48",
            openSprite = "location_restaurant_spiffos_01_50"
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ToiletCabinDoor_Blue",
        name = "Toilet cabin door (blue)",
        north = {
            sprite = "fixtures_bathroom_01_49",
            openSprite = "fixtures_bathroom_01_51"
        },
        west = {
            sprite = "fixtures_bathroom_01_48",
            openSprite = "fixtures_bathroom_01_50"
        },
        disabled = true,
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.ToiletCabinDoor_Rose",
        name = "Toilet cabin door (rose)",
        north = {
            sprite = "fixtures_bathroom_01_65",
            openSprite = "fixtures_bathroom_01_67"
        },
        west = {
            sprite = "fixtures_bathroom_01_64",
            openSprite = "fixtures_bathroom_01_66"
        },
        disabled = true,
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.LargeWicket_WoodenWithPeephole",
        name = "Wooden wicket with peephole",
        north = {
            sprite = "fixtures_doors_fences_01_13",
            openSprite = "fixtures_doors_fences_01_15"
        },
        west = {
            sprite = "fixtures_doors_fences_01_12",
            openSprite = "fixtures_doors_fences_01_14"
        },
        disabled = false,
        requires = {
            ["Base.Hinge"] = 2
        }
    },
    {
        fullType = "EADAY.UnknownDoor",
        name = "Unknown or modded door",
        north = {
            sprite = "",
            openSprite = ""
        },
        west = {
            sprite = "",
            openSprite = ""
        },
        requires = {
            ["Base.Hinge"] = 2
        }
    }
}
