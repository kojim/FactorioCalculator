import Graphics.Input as Input
import Graphics.Input.Field as Field
import Dict as Dict
import Text

-- ------------------------------------------
-- データ型定義
-- ------------------------------------------
data Resource = Resource
  { name : String
  , ingredients : [(Resource,Float)]
  , req_time : Float
  , result_count : Float
  }

-- ------------------------------------------
-- データ定義
-- ------------------------------------------

-- -----------------
-- 原材料系
-- -----------------
iron_plate = Resource
  { name         = "鉄板(個数)"
  , ingredients  = []
  , req_time     = 1
  , result_count = 1
  }

copper_plate = Resource
  { name         = "銅板(個数)"
  , ingredients  = []
  , req_time     = 1
  , result_count = 1
  }

coal = Resource
  { name         = "石炭(個数)"
  , ingredients  = []
  , req_time     = 1
  , result_count = 1
  }

petroleum_gas = Resource
  { name         = "プロパンガス(個数)"
  , ingredients  = []
  , req_time     = 1
  , result_count = 1
  }

water = Resource
  { name         = "水(個数)"
  , ingredients  = []
  , req_time     = 1
  , result_count = 1
  }

heavy_oil = Resource
  { name         = "重油(個数)"
  , ingredients  = []
  , req_time     = 1
  , result_count = 1
  }

lubricant = Resource
  { name         = "潤滑油(個数)"
  , ingredients  = []
  , req_time     = 1
  , result_count = 1
  }


-- -----------------
-- 中間素材
-- -----------------
iron_gear_wheel = Resource
  { name         = "歯車"
  , ingredients  = [ (iron_plate, 2) ]
  , req_time     = 0.5
  , result_count = 1
  }

copper_cable = Resource
  { name         = "銅線"
  , ingredients  = [ (copper_plate, 1)
                   ]
  , req_time     = 0.5
  , result_count = 2
  }

steel_plate = Resource
  { name         = "鋼材"
  , ingredients  = [ (iron_plate, 5)
                   ]
  , req_time     = 17.5
  , result_count = 1
  }

pipe = Resource
  { name         = "パイプ"
  , ingredients  = [ (iron_plate, 1)
                   ]
  , req_time     = 0.5
  , result_count = 1
  }

electronic_circuit = Resource
  { name         = "電子回路"
  , ingredients  = [ (iron_plate, 1)
                   , (copper_cable, 3)
                   ]
  , req_time     = 0.5
  , result_count = 1
  }

advanced_circuit = Resource
  { name         = "発展回路"
  , ingredients  = [ (electronic_circuit, 2)
                   , (plastic_bar, 2)
                   , (copper_cable, 4)
                   ]
  , req_time     = 8
  , result_count = 1
  }
processing_unit = Resource
  { name         = "制御基盤"
  , ingredients  = [ (electronic_circuit, 20)
                   , (advanced_circuit, 2)
                   , (sulfuric_acid, 0.5)
                   ]
  , req_time     = 8
  , result_count = 1
  }

-- -----------------
-- 物流系
-- -----------------
basic_transport_belt = Resource
  { name         = "ベルトコンベア"
  , ingredients  = [ (iron_plate, 1)
                   , (iron_gear_wheel, 1)
                   ]
  , req_time     = 0.5
  , result_count = 2
  }

basic_inserter = Resource
  { name         = "インサーター"
  , ingredients  = [ (electronic_circuit, 1)
                   , (iron_gear_wheel, 1)
                   , (iron_plate, 1)
                   ]
  , req_time     = 0.5
  , result_count = 1
  }

fast_inserter = Resource
  { name         = "高速インサーター"
  , ingredients  = [ (electronic_circuit, 2)
                   , (iron_plate, 2)
                   , (basic_inserter, 1)
                   ]
  , req_time     = 0.5
  , result_count = 1
  }

smart_inserter = Resource
  { name         = "スマートインサーター"
  , ingredients  = [ (fast_inserter, 1)
                   , (electronic_circuit, 4)
                   ]
  , req_time     = 0.5
  , result_count = 1
  }

-- -----------------
-- 化学系
-- -----------------
plastic_bar = Resource
  { name         = "プラスチック棒"
  , ingredients  = [ (coal, 1)
                   , (petroleum_gas, 3)
                   ]
  , req_time     = 1
  , result_count = 2
  }

sulfur = Resource
  { name         = "硫黄"
  , ingredients  = [ (water, 3)
                   , (petroleum_gas, 3)
                   ]
  , req_time     = 1
  , result_count = 2
  }

sulfuric_acid = Resource
  { name         = "硫酸"
  , ingredients  = [ (sulfur, 2)
                   , (iron_plate, 1)
                   , (water, 5)
                   ]
  , req_time     = 1
  , result_count = 5
  }

-- -----------------
-- 機械類
-- -----------------
battery = Resource
  { name         = "電池"
  , ingredients  = [ (sulfuric_acid, 2)
                   , (iron_plate, 1)
                   , (copper_plate, 1)
                   ]
  , req_time     = 5
  , result_count = 1
  }

engine_unit = Resource
  { name         = "エンジンユニット"
  , ingredients  = [ (steel_plate, 1)
                   , (iron_gear_wheel, 1)
                   , (pipe, 2)
                   ]
  , req_time     = 20
  , result_count = 1
  }

electric_engine_unit = Resource
  { name         = "電気エンジンユニット"
  , ingredients  = [ (engine_unit, 1)
                   , (lubricant, 2)
                   , (electronic_circuit, 2)
                   ]
  , req_time     = 20
  , result_count = 1
  }

flying_robot_frame = Resource
  { name         = "飛行ロボットフレーム"
  , ingredients  = [ (electric_engine_unit, 1)
                   , (battery, 2)
                   , (steel_plate, 1)
                   , (electronic_circuit, 3)
                   ]
  , req_time     = 20
  , result_count = 1
  }

-- -----------------
-- サイエンスパック
-- -----------------
science_pack_1 = Resource
  { name         = "サイエンスパック1"
  , ingredients  = [ (copper_plate, 1)
                   , (iron_gear_wheel, 1)
                   ]
  , req_time     = 5
  , result_count = 1
  }

science_pack_2 = Resource
  { name         = "サイエンスパック2"
  , ingredients  = [ (basic_transport_belt, 1)
                   , (basic_inserter, 1)
                   ]
  , req_time     = 6
  , result_count = 1
  }

science_pack_3 = Resource
  { name         = "サイエンスパック3"
  , ingredients  = [ (battery, 1)
                   , (advanced_circuit, 1)
                   , (smart_inserter, 1)
                   , (steel_plate, 1)
                   ]
  , req_time     = 12
  , result_count = 1
  }


all_resources : [Resource]
all_resources =
  [ iron_plate
  , copper_plate
  , coal
  , petroleum_gas
  , water
  , heavy_oil
  , lubricant
  ] ++ resources

resources : [Resource]
resources =
  [ iron_gear_wheel
  , copper_cable
  , steel_plate
  , pipe
  , electronic_circuit
  , advanced_circuit
  , basic_transport_belt
  , basic_inserter
  , fast_inserter
  , smart_inserter
  , plastic_bar
  , sulfur
  , sulfuric_acid
  , battery
  , engine_unit
  , electric_engine_unit
  , flying_robot_frame
  , science_pack_1
  , science_pack_2
  , science_pack_3
  ]


-- ------------------------------------------
-- main
-- ------------------------------------------
main : Signal Element
main = lift2 display item_type.signal item_count.signal

-- ------------------------------------------
-- inputs
-- ------------------------------------------
item_type  : Input.Input Resource
item_type  = Input.input iron_plate
item_count : Input.Input Float
item_count = Input.input 0.1

-- ------------------------------------------
-- functions
-- ------------------------------------------
display : Resource -> Float -> Element
display item require_ps =
    color grey (container 500 800 middle
      (flow down
        [ color lightGrey (flow down
          [ flow right
            [ container 200 30 middle (leftAligned (toText ("作りたいもの")))
            , container 200 30 middle (Input.dropDown item_type.handle (map (\(Resource r) -> (r.name, Resource r)) resources))
            ]
          , flow right
            [ container 200 30 middle (leftAligned (toText ("秒間いくつ作る？")))
            , container 200 30 middle (Input.dropDown item_count.handle (map (\n -> (show n, n)) [ 0.1, 0.3, 1, 3, 10 , 30 ]))
            ]
          ])
        , flow down
          [ flow right
            [ container 200 30 middle (leftAligned (toText ("必要な組立機")))
            , container 200 30 middle (leftAligned (toText ("数")))
            ]
          , toElement (mergeResults(calc item require_ps))
          ]
        ]
      )
    )


toElement : [(String, Float)] -> Element
toElement rfs =
  flow down (map toElement' rfs)

toElement' : (String, Float) -> Element
toElement' (name,f) =
  flow right
    [ container 200 30 middle (leftAligned (toText name))
    , container 200 30 middle (rightAligned (toText (show (roundFloat f))))
    ]

-- 生産対象 -> 必要秒間生産数 -> [(施設種別, 必要施設数)]
calc : Resource -> Float -> [(Resource, Float)]
calc (Resource item) require_ps =
  let product_per_unit = item.result_count / item.req_time -- 施設1つあたりの秒間生産数
      units = require_ps / product_per_unit                -- 必要施設数
      running_ps = 1 / item.req_time                       -- 施設の秒間稼動回数
  in (Resource item, units) :: (concatMap (\(r,n) -> calc r (n*units*running_ps)) item.ingredients)

-- 結果をマージ&ソートする
mergeResults : [(Resource, Float)] -> [(String, Float)]
mergeResults rfs =
  let nfs  = map (\(Resource r, f) -> (r.name, f)) rfs
      dict = foldl (\(name, f) dict ->
              let sum = Dict.getOrElse 0 name dict
              in  Dict.insert name (sum+f) dict
             ) Dict.empty nfs
      list = Dict.toList dict
  in sortBy (\(name,f) -> toId name) list

-- マージしない版 (デバッグ用)
mergeResults' : [(Resource, Float)] -> [(String, Float)]
mergeResults' rfs = map (\(Resource r,f) -> (r.name,f)) rfs

-- 小数点以下3桁で丸める
roundFloat : Float -> Float
roundFloat f = (toFloat (round (f*100))) / 100

toId : String -> Int
toId name =
  let indexed_resource = zip [1..100] all_resources
      id_r = filter (\(n,Resource r) -> r.name == name) indexed_resource
  in fst (head id_r)
