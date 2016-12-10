<GameFile>
  <PropertyGroup Name="TetrisScene" Type="Scene" ID="795413a3-2586-4371-9d94-61efcce58dd4" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Scene" Tag="24" ctype="GameNodeObjectData">
        <Size X="640.0000" Y="1136.0000" />
        <Children>
          <AbstractNodeData Name="panel" ActionTag="1918327196" Tag="34" IconVisible="False" TouchEnable="True" ClipAble="False" ColorAngle="90.0000" LeftEage="131" RightEage="131" TopEage="288" BottomEage="288" Scale9OriginX="-131" Scale9OriginY="-288" Scale9Width="262" Scale9Height="576" ctype="PanelObjectData">
            <Size X="640.0000" Y="1136.0000" />
            <Children>
              <AbstractNodeData Name="scene_bg" ActionTag="-389944647" Tag="64" IconVisible="False" PositionPercentXEnabled="True" PositionPercentYEnabled="True" LeftMargin="-106.0000" RightMargin="-106.0000" LeftEage="281" RightEage="281" TopEage="374" BottomEage="374" Scale9OriginX="281" Scale9OriginY="374" Scale9Width="290" Scale9Height="388" ctype="ImageViewObjectData">
                <Size X="852.0000" Y="1136.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="320.0000" Y="568.0000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.5000" Y="0.5000" />
                <PreSize X="1.3312" Y="1.0000" />
                <FileData Type="Normal" Path="ui/tetris/scene_bg.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="bg_bk" ActionTag="867144031" Tag="63" IconVisible="False" LeftMargin="-13.2597" RightMargin="-15.7403" TopMargin="-17.5854" BottomMargin="240.5854" LeftEage="220" RightEage="220" TopEage="301" BottomEage="301" Scale9OriginX="220" Scale9OriginY="301" Scale9Width="229" Scale9Height="311" ctype="ImageViewObjectData">
                <Size X="669.0000" Y="913.0000" />
                <AnchorPoint />
                <Position X="-13.2597" Y="240.5854" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="-0.0207" Y="0.2118" />
                <PreSize X="1.0453" Y="0.8037" />
                <FileData Type="Normal" Path="ui/tetris/bg_bk.png" Plist="" />
              </AbstractNodeData>
              <AbstractNodeData Name="tetris_bg" ActionTag="-1835008995" Tag="13" IconVisible="False" LeftMargin="35.0000" RightMargin="222.0000" TopMargin="35.0000" BottomMargin="286.0000" ctype="SpriteObjectData">
                <Size X="383.0000" Y="815.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="226.5000" Y="693.5000" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.3539" Y="0.6105" />
                <PreSize X="0.5984" Y="0.7174" />
                <FileData Type="Normal" Path="ui/tetris/bg.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_down_low" ActionTag="618124103" Tag="15" IconVisible="False" LeftMargin="105.5000" RightMargin="438.5000" TopMargin="1009.9086" BottomMargin="30.0914" TouchEnable="True" FontSize="28" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="66" Scale9Height="74" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="96.0000" Y="96.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="153.5000" Y="78.0914" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.2398" Y="0.0687" />
                <PreSize X="0.1500" Y="0.0845" />
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Normal" Path="ui/tetris/down.png" Plist="" />
                <PressedFileData Type="Normal" Path="ui/tetris/down.png" Plist="" />
                <NormalFileData Type="Normal" Path="ui/tetris/down.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_down" ActionTag="1650258263" Tag="42" IconVisible="False" LeftMargin="369.6349" RightMargin="174.3651" TopMargin="882.0959" BottomMargin="157.9041" TouchEnable="True" FontSize="28" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="66" Scale9Height="74" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="96.0000" Y="96.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="417.6349" Y="205.9041" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.6526" Y="0.1813" />
                <PreSize X="0.1500" Y="0.0845" />
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Normal" Path="ui/tetris/down_fast.png" Plist="" />
                <PressedFileData Type="Normal" Path="ui/tetris/down_fast.png" Plist="" />
                <NormalFileData Type="Normal" Path="ui/tetris/down_fast.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="lb_score_title" ActionTag="-122094484" Tag="38" IconVisible="False" LeftMargin="449.0606" RightMargin="90.9394" TopMargin="56.5544" BottomMargin="1047.4456" FontSize="28" LabelText="SCORE" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="100.0000" Y="32.0000" />
                <AnchorPoint ScaleX="0.5578" ScaleY="0.8825" />
                <Position X="504.8406" Y="1075.6855" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="0" B="0" />
                <PrePosition X="0.7888" Y="0.9469" />
                <PreSize X="0.1563" Y="0.0282" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="score_bg" ActionTag="92402435" Tag="37" IconVisible="False" LeftMargin="443.2690" RightMargin="76.7310" TopMargin="96.1306" BottomMargin="839.8694" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="120.0000" Y="200.0000" />
                <Children>
                  <AbstractNodeData Name="lb_score" ActionTag="1120273999" Tag="39" IconVisible="False" LeftMargin="30.5464" RightMargin="35.4536" TopMargin="71.5012" BottomMargin="91.4988" FontSize="32" LabelText="100" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="54.0000" Y="37.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="57.5464" Y="109.9988" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4796" Y="0.5500" />
                    <PreSize X="0.4500" Y="0.1850" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="0" G="0" B="0" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint />
                <Position X="443.2690" Y="839.8694" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.6926" Y="0.7393" />
                <PreSize X="0.1875" Y="0.1761" />
                <SingleColor A="255" R="57" G="141" B="234" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="lb_next_title" ActionTag="202446109" Tag="36" IconVisible="False" LeftMargin="464.1984" RightMargin="100.8016" TopMargin="326.8862" BottomMargin="777.1138" FontSize="28" LabelText="NEXT" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                <Size X="75.0000" Y="32.0000" />
                <AnchorPoint ScaleX="0.4821" ScaleY="0.6071" />
                <Position X="500.3559" Y="796.5410" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="0" G="0" B="0" />
                <PrePosition X="0.7818" Y="0.7012" />
                <PreSize X="0.1172" Y="0.0282" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="next_bg" ActionTag="1947493623" Tag="35" IconVisible="False" LeftMargin="446.3487" RightMargin="73.6513" TopMargin="366.4624" BottomMargin="569.5376" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                <Size X="120.0000" Y="200.0000" />
                <AnchorPoint />
                <Position X="446.3487" Y="569.5376" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.6974" Y="0.5014" />
                <PreSize X="0.1875" Y="0.1761" />
                <SingleColor A="255" R="57" G="141" B="234" />
                <FirstColor A="255" R="150" G="200" B="255" />
                <EndColor A="255" R="255" G="255" B="255" />
                <ColorVector ScaleY="1.0000" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_play" ActionTag="608945743" Tag="41" IconVisible="False" LeftMargin="71.0040" RightMargin="328.9960" TopMargin="576.5071" BottomMargin="439.4929" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="210" Scale9Height="98" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="240.0000" Y="120.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="191.0040" Y="499.4929" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.2984" Y="0.4397" />
                <PreSize X="0.3750" Y="0.1056" />
                <TextColor A="255" R="65" G="65" B="70" />
                <DisabledFileData Type="PlistSubImage" Path="PlayButton.png" Plist="res/pack.plist" />
                <PressedFileData Type="PlistSubImage" Path="PlayButton.png" Plist="res/pack.plist" />
                <NormalFileData Type="PlistSubImage" Path="PlayButton.png" Plist="res/pack.plist" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_shift" ActionTag="-1740025647" Tag="27" IconVisible="False" LeftMargin="459.6125" RightMargin="27.3875" TopMargin="954.6723" BottomMargin="28.3277" TouchEnable="True" FontSize="28" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="123" Scale9Height="131" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="153.0000" Y="153.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="536.1125" Y="104.8277" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.8377" Y="0.0923" />
                <PreSize X="0.2391" Y="0.1347" />
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Normal" Path="ui/tetris/shift.png" Plist="" />
                <PressedFileData Type="Normal" Path="ui/tetris/shift.png" Plist="" />
                <NormalFileData Type="Normal" Path="ui/tetris/shift.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_right" ActionTag="-1978374155" Tag="26" IconVisible="False" LeftMargin="176.0002" RightMargin="367.9998" TopMargin="882.6605" BottomMargin="157.3395" TouchEnable="True" FontSize="28" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="66" Scale9Height="74" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="96.0000" Y="96.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="224.0002" Y="205.3395" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.3500" Y="0.1808" />
                <PreSize X="0.1500" Y="0.0845" />
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Normal" Path="ui/tetris/right.png" Plist="" />
                <PressedFileData Type="Normal" Path="ui/tetris/right.png" Plist="" />
                <NormalFileData Type="Normal" Path="ui/tetris/right.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
              <AbstractNodeData Name="btn_left" ActionTag="-780245045" Tag="25" IconVisible="False" LeftMargin="35.0001" RightMargin="508.9999" TopMargin="882.8651" BottomMargin="157.1349" TouchEnable="True" FontSize="28" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="66" Scale9Height="74" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                <Size X="96.0000" Y="96.0000" />
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="83.0001" Y="205.1349" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.1297" Y="0.1806" />
                <PreSize X="0.1500" Y="0.0845" />
                <TextColor A="255" R="255" G="255" B="255" />
                <DisabledFileData Type="Normal" Path="ui/tetris/left.png" Plist="" />
                <PressedFileData Type="Normal" Path="ui/tetris/left.png" Plist="" />
                <NormalFileData Type="Normal" Path="ui/tetris/left.png" Plist="" />
                <OutlineColor A="255" R="255" G="0" B="0" />
                <ShadowColor A="255" R="110" G="110" B="110" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
            <Position X="320.0000" Y="568.0000" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition X="0.5000" Y="0.5000" />
            <PreSize X="1.0000" Y="1.0000" />
            <SingleColor A="255" R="255" G="255" B="255" />
            <FirstColor A="255" R="150" G="200" B="255" />
            <EndColor A="255" R="255" G="255" B="255" />
            <ColorVector ScaleY="1.0000" />
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>