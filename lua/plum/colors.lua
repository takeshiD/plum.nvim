---@class plum.Palette
---@field bg string
---@field bg_alt string
---@field bg_float string
---@field bg_solid? string  -- theme.lua が透過時に実色を保持するために追加
---@field fg string
---@field fg_muted string
---@field fg_subtle string
---@field selection string
---@field cursorline string
---@field border string
---@field comment string
---@field pink string
---@field pink_bright string
---@field plum string
---@field purple string
---@field green string
---@field jade string
---@field cyan string
---@field blue string
---@field yellow string
---@field orange string
---@field red string

---@class plum.Colors
---@field dark plum.Palette
---@field light plum.Palette
local M = {}

M.dark = {
    -- base
    bg         = "#0F0606", -- Abyss Black      R13 G12 B14: ほぼ純黒・僅かな紫下地
    bg_alt     = "#151318", -- Ink Dark         R21 G19 B24: サイドバー・分割ペイン
    bg_float   = "#1D1B22", -- Deep Dark        R29 G27 B34: フロート・ポップアップ
    fg         = "#F9F5FF", -- Frost White       ほぼ純白・クール
    fg_muted   = "#C4B4E2", -- Pale Violet       非アクティブ
    fg_subtle  = "#7A6890", -- Dusk Violet       控えめテキスト
    selection  = "#2A2A2A", -- Plum Wine Dark    R42 G18 B40: 均衡のとれたダークプラム
    cursorline = "#2A2A2A", -- Shadow Line       R20 G18 B24: 控えめなカーソル行
    border     = "#8B2060", -- Plum Wine         ウィンドウ枠
    comment    = "#8D8282", -- Smoke Mauve       コメント
    -- accents (hue order: 28° → 42° → 145° → 172° → 180° → 210° → 275° → 330° → 340° → 357°)
    orange     = "#FFA020", -- Plum Flesh        28°  果肉オレンジ
    yellow     = "#FFD838", -- Flesh Gold        42°  果肉ゴールド
    green      = "#35E888", -- Leaf Flash        145° すもも葉グリーン
    jade       = "#18CDB5", -- Teal Jewel        172° 補色方向テール
    cyan       = "#00E5E5", -- Ice Cyan          180° 皮の純補色
    blue       = "#48A8FF", -- Sky Burst         210° トライアド青
    purple     = "#B060FF", -- Vivid Violet      275° トライアド紫
    plum       = "#E03080", -- Deep Plum Red     330° 紫レッド系
    pink       = "#FF3070", -- Plum Skin Flash   340° 皮ピンクレッド主色
    pink_bright = "#FF80AA", -- Petal Flash      340° pink の淡色版
    red        = "#FF2040", -- Blood Alarm       357° エラー専用純赤
}

M.light = {
    -- base
    bg         = "#F7F2E2", -- Warm Parchment     R247 G242 B226: パーチメント調アイボリー
    bg_alt     = "#EDE4D2", -- Linen              R237 G228 B210: 温かいリネン
    bg_float   = "#F9F5E8", -- Ivory Float        R249 G245 B232: フロート（bg より僅かに明）
    fg         = "#120810", -- Deep Night         ほぼ純黒・紫下地
    fg_muted   = "#3C2048", -- Plum Ink           非アクティブ
    fg_subtle  = "#7A5880", -- Dusty Plum         控えめテキスト
    selection  = "#FFD4E6", -- Plum Blossom       R255 G212 B230: 温かみのあるプラム選択
    cursorline = "#EEE5D2", -- Parchment Line     R238 G229 B210: bg より暗め・視認性確保
    border     = "#8A1850", -- Plum Wine          ウィンドウ枠
    comment    = "#8A6878", -- Dusty Mauve        コメント
    -- accents
    orange     = "#B85800", -- Burnt Flesh        28°
    yellow     = "#9A6400", -- Dark Gold          40°
    green      = "#0A8840", -- Forest Leaf        145°
    jade       = "#0A7870", -- Deep Teal          172°
    cyan       = "#007888", -- Deep Cyan          180°
    blue       = "#1840D8", -- Indigo Flash       225°
    purple     = "#6018CC", -- Royal Violet       270°
    plum       = "#8A1050", -- Wine Plum          330°
    pink       = "#C0124A", -- Deep Plum Red      345°
    pink_bright = "#D82060", -- Vivid Plum        340°
    red        = "#C00830", -- Deep Red           357°
}

return M
