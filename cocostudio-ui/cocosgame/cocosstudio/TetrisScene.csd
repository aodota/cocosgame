<GameFile>
  <PropertyGroup Name="TetrisScene" Type="Scene" ID="795413a3-2586-4371-9d94-61efcce58dd4" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="0" Speed="1.0000" />
      <ObjectData Name="Scene" Tag="24" ctype="GameNodeObjectData">
        <Size X="640.0000" Y="1136.0000" />
        <Children>
          <AbstractNodeData Name="panel" ActionTag="1918327196" Tag="34" IconVisible="False" LeftMargin="0.0001" RightMargin="-0.0001" TopMargin="-2.2102" BottomMargin="2.2102" TouchEnable="True" ClipAble="False" ComboBoxIndex="1" ColorAngle="90.0000" LeftEage="131" RightEage="131" TopEage="288" BottomEage="288" Scale9OriginX="-131" Scale9OriginY="-288" Scale9Width="262" Scale9Height="576" ctype="PanelObjectData">
            <Size X="640.0000" Y="1136.0000" />
            <Children>
              <AbstractNodeData Name="tetris_bg" ActionTag="-1835008995" Tag="13" IconVisible="False" LeftMargin="52.4689" RightMargin="204.5311" TopMargin="50.3264" BottomMargin="270.6736" ctype="SpriteObjectData">
                <Size X="383.0000" Y="815.0000" />
                <Children>
                  <AbstractNodeData Name="btn_left" ActionTag="-780245045" Tag="25" IconVisible="False" LeftMargin="-35.6041" RightMargin="220.6041" TopMargin="882.5200" BottomMargin="-137.5201" TouchEnable="True" FontSize="28" ButtonText="左" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="168" Scale9Height="48" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="198.0000" Y="70.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="63.3959" Y="-102.5201" />
                    <Scale ScaleX="0.7200" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.1655" Y="-0.1258" />
                    <PreSize X="0.4987" Y="0.0800" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_right" ActionTag="-1978374155" Tag="26" IconVisible="False" LeftMargin="134.0883" RightMargin="50.9117" TopMargin="882.5220" BottomMargin="-137.5220" TouchEnable="True" FontSize="28" ButtonText="右" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="168" Scale9Height="48" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="198.0000" Y="70.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="233.0883" Y="-102.5220" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.6086" Y="-0.1258" />
                    <PreSize X="0.4987" Y="0.0800" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_shift" ActionTag="-1740025647" Tag="27" IconVisible="False" LeftMargin="325.5926" RightMargin="-140.5926" TopMargin="877.2748" BottomMargin="-132.2747" TouchEnable="True" FontSize="28" ButtonText="翻转" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="168" Scale9Height="48" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="198.0000" Y="70.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="424.5926" Y="-97.2747" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="1.1086" Y="-0.1194" />
                    <PreSize X="0.4987" Y="0.0800" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_play" ActionTag="608945743" Tag="41" IconVisible="False" LeftMargin="71.0040" RightMargin="71.9960" TopMargin="255.5071" BottomMargin="439.4929" TouchEnable="True" FontSize="14" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="210" Scale9Height="98" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="240.0000" Y="120.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="191.0040" Y="499.4929" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4987" Y="0.6129" />
                    <PreSize X="0.6045" Y="0.1371" />
                    <TextColor A="255" R="65" G="65" B="70" />
                    <DisabledFileData Type="PlistSubImage" Path="PlayButton.png" Plist="res/pack.plist" />
                    <PressedFileData Type="PlistSubImage" Path="PlayButton.png" Plist="res/pack.plist" />
                    <NormalFileData Type="PlistSubImage" Path="PlayButton.png" Plist="res/pack.plist" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="next_bg" ActionTag="1947493623" Tag="35" IconVisible="False" LeftMargin="429.6034" RightMargin="-166.6034" TopMargin="284.6500" BottomMargin="330.3500" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size X="120.0000" Y="200.0000" />
                    <AnchorPoint />
                    <Position X="429.6034" Y="330.3500" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="1.1217" Y="0.4053" />
                    <PreSize X="0.3023" Y="0.2286" />
                    <SingleColor A="255" R="57" G="141" B="234" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Text_1" ActionTag="202446109" Tag="36" IconVisible="False" LeftMargin="447.4538" RightMargin="-139.4539" TopMargin="245.0743" BottomMargin="537.9257" FontSize="28" LabelText="NEXT" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="75.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.4821" ScaleY="0.6071" />
                    <Position X="483.6113" Y="557.3528" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="0" G="0" B="0" />
                    <PrePosition X="1.2627" Y="0.6839" />
                    <PreSize X="0.1889" Y="0.0366" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="score_bg" ActionTag="92402435" Tag="37" IconVisible="False" LeftMargin="422.5586" RightMargin="-159.5586" TopMargin="37.9897" BottomMargin="577.0103" TouchEnable="True" ClipAble="False" BackColorAlpha="102" ComboBoxIndex="1" ColorAngle="90.0000" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
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
                    <Position X="422.5586" Y="577.0103" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="1.1033" Y="0.7080" />
                    <PreSize X="0.3023" Y="0.2286" />
                    <SingleColor A="255" R="57" G="141" B="234" />
                    <FirstColor A="255" R="150" G="200" B="255" />
                    <EndColor A="255" R="255" G="255" B="255" />
                    <ColorVector ScaleY="1.0000" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Text_1_0" ActionTag="-122094484" Tag="38" IconVisible="False" LeftMargin="428.3475" RightMargin="-145.3475" TopMargin="-1.5854" BottomMargin="784.5854" FontSize="28" LabelText="SCORE" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="TextObjectData">
                    <Size X="100.0000" Y="32.0000" />
                    <AnchorPoint ScaleX="0.5578" ScaleY="0.8825" />
                    <Position X="484.1302" Y="812.8262" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="0" G="0" B="0" />
                    <PrePosition X="1.2640" Y="0.9973" />
                    <PreSize X="0.2519" Y="0.0366" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="btn_down" ActionTag="1650258263" Tag="42" IconVisible="False" LeftMargin="60.5116" RightMargin="124.4884" TopMargin="987.4950" BottomMargin="-242.4950" TouchEnable="True" FontSize="28" ButtonText="下" Scale9Enable="True" LeftEage="15" RightEage="15" TopEage="11" BottomEage="11" Scale9OriginX="15" Scale9OriginY="11" Scale9Width="168" Scale9Height="48" ShadowOffsetX="2.0000" ShadowOffsetY="-2.0000" ctype="ButtonObjectData">
                    <Size X="198.0000" Y="70.0000" />
                    <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                    <Position X="159.5116" Y="-207.4950" />
                    <Scale ScaleX="1.0000" ScaleY="1.0000" />
                    <CColor A="255" R="255" G="255" B="255" />
                    <PrePosition X="0.4165" Y="-0.2546" />
                    <PreSize X="0.4987" Y="0.0800" />
                    <TextColor A="255" R="255" G="255" B="255" />
                    <DisabledFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <PressedFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <NormalFileData Type="Normal" Path="ui/button/green_btn.png" Plist="" />
                    <OutlineColor A="255" R="255" G="0" B="0" />
                    <ShadowColor A="255" R="110" G="110" B="110" />
                  </AbstractNodeData>
                </Children>
                <AnchorPoint ScaleX="0.5000" ScaleY="0.5000" />
                <Position X="243.9689" Y="678.1736" />
                <Scale ScaleX="1.0000" ScaleY="1.0000" />
                <CColor A="255" R="255" G="255" B="255" />
                <PrePosition X="0.3812" Y="0.5970" />
                <PreSize X="0.0719" Y="0.0405" />
                <FileData Type="Normal" Path="ui/tetris/bg.png" Plist="" />
                <BlendFunc Src="1" Dst="771" />
              </AbstractNodeData>
            </Children>
            <AnchorPoint />
            <Position X="0.0001" Y="2.2102" />
            <Scale ScaleX="1.0000" ScaleY="1.0000" />
            <CColor A="255" R="255" G="255" B="255" />
            <PrePosition Y="0.0019" />
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