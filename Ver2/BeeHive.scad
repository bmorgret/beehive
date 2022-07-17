Display="Hive"; // ["Super","Base","Lid","Bottom","Side","OuterFront","InnerFront","OuterBack","InnerBack","BaseSide","BaseOuterFront","BaseInnerFront","BaseOuterBack","BaseInnerBack","LidSide","LidOuterFront","LidInnerFront","LidOuterBack","LidInnerBack","LidPanel","LidTemplate","FrameTops","FrameBottoms","Calibration"]
// Number of frames
NumFrames=4; // [4, 8, 10]
FrameLength=9.5; // [9.5,19]
HiveThickness=.375; // [.375:3/8,.5:1/2,.75:3/4]
Scale=1;
SmallNailHole=.8;
LargeNailHole=.75;
ScrewHole=2;
// Number of Finger Joints on Corners
NumCornerFJ=4; // [2,4,6]
// Number of Finger Joints on the Bottom of the Front and Back
NumFrontBackFJ=3; // [3,5,7]
// Number of Finger Joints on the Bottom of the Sides
NumSideFJ=5; // [3,5,7]

BeeSpace=3/8;
FrameWidth=1+3/8;
FrameHeight=6+1/4;
TabLength=5/8;
FrameThickness=3/8;

HiveHeight=FrameHeight+BeeSpace*2+HiveThickness;
HiveLength=FrameLength+HiveThickness*2+1/8;
HiveWidth=FrameWidth*NumFrames+BeeSpace+HiveThickness*2;
CornerFJ=(HiveHeight-FrameThickness-BeeSpace)/NumCornerFJ;
SideFJ=HiveLength/NumSideFJ;
FrontBackFJ=HiveWidth/NumFrontBackFJ;
LidLength=HiveLength+1/4;
LidWidth=HiveWidth+1/4;
LidHeight=HiveThickness+1+HiveThickness;
BaseHeight=BeeSpace*3+HiveThickness*3;

if(Display=="Super") Super();
if(Display=="Base") Base();
if(Display=="Lid") Lid();
if(Display=="Bottom") rotate([0,0,90])Bottom2d();
if(Display=="OuterFront") rotate([0,0,90])FrontBack2d("Outer","Front");
if(Display=="InnerFront") rotate([0,0,90])FrontBack2d("Inner","Front");
if(Display=="OuterBack") rotate([0,0,90])FrontBack2d("Outer","Back");
if(Display=="InnerBack") rotate([0,0,90])FrontBack2d("Inner","Back");
if(Display=="Side") rotate([0,0,90])Side2d();
if(Display=="BaseOuterFront") rotate([0,0,90])BaseFrontBack2d("Outer","Front");
if(Display=="BaseInnerFront") rotate([0,0,90])BaseFrontBack2d("Inner","Front");
if(Display=="BaseOuterBack") rotate([0,0,90])BaseFrontBack2d("Outer","Back");
if(Display=="BaseInnerBack") rotate([0,0,90])BaseFrontBack2d("Inner","Back");
if(Display=="BaseSide") rotate([0,0,90])BaseSide2d();
if(Display=="LidOuterFront") rotate([0,0,90])LidFrontBack2d("Outer","Front");
if(Display=="LidInnerFront") rotate([0,0,90])LidFrontBack2d("Inner","Front");
if(Display=="LidOuterBack") rotate([0,0,90])LidFrontBack2d("Outer","Back");
if(Display=="LidInnerBack") rotate([0,0,90])LidFrontBack2d("Inner","Back");
if(Display=="LidSide") rotate([0,0,90])LidSide2d();
if(Display=="LidPanel") rotate([0,0,90])LidPanel2d();
if(Display=="FrameTops") {spacing=30;FrameTop2d(); translate([0,spacing,0]) FrameTop2d();translate([0,spacing*2,0]) FrameTop2d();translate([0,spacing*3,0]) FrameTop2d();translate([0,spacing*4,0]) FrameTop2d();translate([0,spacing*5,0]) FrameTop2d();} 
if(Display=="FrameBottoms") {spacing=30;FrameBottom2d();translate([0,spacing,0]) FrameBottom2d();translate([0,spacing*2,0]) FrameBottom2d();translate([0,spacing*3,0]) FrameBottom2d();translate([0,spacing*4,0]) FrameBottom2d();translate([0,spacing*5,0]) FrameBottom2d();}
if(Display=="LidTemplate") LidTemplate2d();
if(Display=="Calibration") {square([100,100]);}

mHiveHeight=HiveHeight*25.4*Scale;
mHiveWidth=HiveWidth*25.4*Scale;
mHiveLength=HiveLength*25.4*Scale;
mCornerFJ=CornerFJ*25.4*Scale;
mSideFJ=SideFJ*25.4*Scale;
mFrontBackFJ=FrontBackFJ*25.4*Scale;
mHiveThickness=HiveThickness*25.4*Scale;
mFrameWidth=FrameWidth*25.4*Scale;
mFrameLength=FrameLength*25.4*Scale;
mFrameThickness=FrameThickness*25.4*Scale;
mTabLength=TabLength*25.4*Scale;
mBeeSpace=BeeSpace*25.4*Scale;
mLidLength=LidLength*25.4*Scale;
mLidWidth=LidWidth*25.4*Scale;
mLidHeight=LidHeight*25.4*Scale;
mBaseHeight=BaseHeight*25.4*Scale;

module Lid(){
    translate([0,0,0])TD(mHiveThickness)LidPanel2d();
    translate([0,0,mLidHeight-mHiveThickness])TD(mHiveThickness)LidPanel2d();
    translate([0+mHiveThickness,0,0])rotate([0,-90,0]) TD(mHiveThickness)LidSide2d();
    translate([mHiveWidth,0,0])rotate([0,-90,0]) TD(mHiveThickness)LidSide2d();
    translate([0,0,0])rotate([0,-90,-90]) TD(mHiveThickness)LidFrontBack2d("Outer","Front");
    translate([0,mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)LidFrontBack2d("Inner","Front");
    translate([0,mHiveLength-mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)LidFrontBack2d("Outer","Back");
    translate([0,mHiveLength-mHiveThickness*2,0])rotate([0,-90,-90]) TD(mHiveThickness)LidFrontBack2d("Inner","Back");
}
module LidFrontBack2d(IO,FB){
    difference() {
        square([mLidHeight,mHiveWidth]);
        FJBothSides(mLidHeight/3,mHiveThickness,mLidHeight,LargeNailHole,true,mHiveWidth);
        translate([mHiveThickness,0,0])rotate([0,0,90]){
            FJ(mFrontBackFJ,mHiveThickness,mHiveWidth,LargeNailHole,false);
        }
        translate([mLidHeight,0,0])rotate([0,0,90]){
            FJ(mFrontBackFJ,mHiveThickness,mHiveWidth,LargeNailHole,false);
        }
    }
    //Add tab to bottom to lock in super
    if(IO=="Inner"){
        translate([-mHiveThickness,mHiveThickness+mBeeSpace,0]){
            difference(){
                length=mHiveWidth-mHiveThickness*2-mBeeSpace*2;
                square([mBeeSpace,length]);
                polygon([[0,0],[0,mBeeSpace/3],[mBeeSpace,0],[0,0]]);
                polygon([[0,length],[0,length-mBeeSpace/3],[mBeeSpace,length],[0,length]]);
            }
        }
    }
}
module LidSide2d(){
    difference() {
        square([mLidHeight,mHiveLength]);
        FJBothSides(mLidHeight/3,mHiveThickness*2+1.5,mBaseHeight,SmallNailHole,false,mHiveLength);
        translate([mHiveThickness,0,0])rotate([0,0,90])FJ(mSideFJ,mHiveThickness,mHiveLength,SmallNailHole,false);
        translate([mLidHeight,0,0])rotate([0,0,90])FJ(mSideFJ,mHiveThickness,mHiveLength,SmallNailHole,false);
    }
}
module LidPanel2d(){
    difference() {
        square([mHiveWidth,mHiveLength]);
        FJBothSides(mFrontBackFJ,mHiveThickness*2+1.5,mHiveWidth,SmallNailHole,true,mHiveLength);
        translate([mHiveWidth,0,0])rotate([0,0,90]){
            FJBothSides(mSideFJ,mHiveThickness,mHiveLength,SmallNailHole,true,mHiveWidth);
        }
        // Drill new holes in half finger joint
        if(NumFrames>4){
            square([mHiveWidth/2,mHiveLength]);
            translate([mHiveWidth/2+mFrontBackFJ/4,mHiveThickness/2-SmallNailHole/2,0])circle(SmallNailHole);
            translate([mHiveWidth/2+mFrontBackFJ/4,mHiveLength-mHiveThickness/2-SmallNailHole/2,0])circle(SmallNailHole);
        }
    }
    //Patch 1/2 hole in 1/2 finger joint
    if(NumFrames>4){
        translate([mHiveWidth/2,mHiveThickness/2,0])square(SmallNailHole*3);
        translate([mHiveWidth/2,mHiveLength-mHiveThickness/2-SmallNailHole*1.5,0])square(SmallNailHole*3);
        }
}

module LidTemplate2d(){
    translate([mLidHeight,mLidHeight,0])square([mHiveLength,mHiveWidth]);
    translate([mLidHeight,0,0])square([mHiveLength,mLidHeight]);
    translate([mLidHeight,mHiveWidth+mLidHeight,0])square([mHiveLength,mLidHeight]);
    translate([0,mLidHeight,0])square([mLidHeight,mHiveWidth]);
    translate([mHiveLength+mLidHeight,mLidHeight,0])square([mLidHeight,mHiveWidth]);
}
module LidInsulation2d(){
    square(mHiveLength-mHiveThickness*4,mHiveWidth-mHiveThickness*2);
}
module Base(){
    translate([0,0,mHiveThickness])TD(mHiveThickness)Bottom2d();
    translate([0+mHiveThickness,0,0])rotate([0,-90,0]) TD(mHiveThickness)BaseSide2d();
    translate([mHiveWidth,0,0])rotate([0,-90,0]) TD(mHiveThickness)BaseSide2d();
    translate([0,0,0])rotate([0,-90,-90]) TD(mHiveThickness)BaseFrontBack2d("Outer","Front");
    translate([0,mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)BaseFrontBack2d("Inner","Front");
    translate([0,mHiveLength-mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)BaseFrontBack2d("Outer","Back");
    translate([0,mHiveLength-mHiveThickness*2,0])rotate([0,-90,-90]) TD(mHiveThickness)BaseFrontBack2d("Inner","Back");
}
module BaseFrontBack2d(IO,FB){
    difference() {
        square([mBaseHeight,mHiveWidth]);
        FJBothSides(mBaseHeight/3,mHiveThickness,mBaseHeight,LargeNailHole,true,mHiveWidth);
        translate([mHiveThickness*2,0,0])rotate([0,0,90]){
            FJ(mFrontBackFJ,mHiveThickness,mHiveWidth,LargeNailHole,false);
        }
        //Cut top for frame ledge
        if(IO=="Inner")translate([mBaseHeight-mBeeSpace,mHiveThickness+mBeeSpace,0])square([mFrameThickness+mBeeSpace,mHiveWidth-mHiveThickness*2-mBeeSpace*2]);
        //Cut entrance
        if(FB=="Front")translate([mHiveThickness*3,mHiveThickness*4,0])square([mBeeSpace*2,mHiveWidth-mHiveThickness*8]);
    }
}
module BaseSide2d(){
    difference() {
        square([mBaseHeight,mHiveLength]);
        FJBothSides(mBaseHeight/3,mHiveThickness*2,mBaseHeight,SmallNailHole,false,mHiveLength);
        translate([mHiveThickness*2,0,0])rotate([0,0,90])FJ(mSideFJ,mHiveThickness,mHiveLength,SmallNailHole,false);
        translate([mHiveHeight-mBeeSpace-SmallNailHole/2,mHiveThickness/2+SmallNailHole/2,0])circle(SmallNailHole);
        translate([mHiveHeight-mBeeSpace-SmallNailHole/2,mHiveLength-(mHiveThickness/2+SmallNailHole/2),0])circle(SmallNailHole);
    }
}
    
module Super(){
    translate([mHiveWidth,0,0])rotate([0,-90,0]) TD(mHiveThickness)Side2d();
    translate([mHiveThickness,0,0])rotate([0,-90,0]) TD(mHiveThickness)Side2d();
    translate([0,0,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Outer","Front");
    translate([0,mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Inner","Front");
    translate([0,mHiveLength-mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Outer","Back");
    translate([0,mHiveLength-mHiveThickness*2,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Inner","Back");
    translate([mHiveThickness+mFrameWidth,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
    translate([mHiveThickness+mFrameWidth*2,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
    translate([mHiveThickness+mFrameWidth*3,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
    translate([mHiveThickness+mFrameWidth*4,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
}
module FrameBottom2d(){
    difference(){
        union(){
            mNotch=1/8*25.4;
            difference() {
                square([mFrameLength,mFrameWidth-mBeeSpace]);
                translate([mTabLength,0,0])square([mFrameThickness,mNotch]);
                translate([mFrameLength-mTabLength-mFrameThickness,0,0])square([mFrameThickness,mNotch]);
                translate([mTabLength,mFrameWidth-mBeeSpace-mNotch,0])square([mFrameThickness,mNotch]);
                translate([mFrameLength-mTabLength-mFrameThickness,mFrameWidth-mBeeSpace-mNotch,0])square([mFrameThickness,mNotch]);
                translate([mTabLength+mFrameThickness/2,(mFrameWidth-mBeeSpace)/2,0])circle(SmallNailHole);
                translate([mFrameLength-mTabLength-mFrameThickness/2,(mFrameWidth-mBeeSpace)/2,0])circle(SmallNailHole);
            }
        }
        translate([-1,-1,0]) square([mTabLength+1,mFrameWidth-BeeSpace+2]);
        translate([mFrameLength-mTabLength,-1,0]) square([mTabLength+1,mFrameWidth-BeeSpace+2]);
    }
}
module FrameTop2d(){
    mNotch=1/16*25.4;
    mStarterLength=4*25.4;
    mStarterWidth=1.3;
    difference() {
        square([mFrameLength,mFrameWidth-mBeeSpace]);
        translate([mTabLength,0,0])square([mFrameThickness,mNotch]);
        translate([mFrameLength-mTabLength-mFrameThickness,0,0])square([mFrameThickness,mNotch]);
        translate([mTabLength,mFrameWidth-mBeeSpace-mNotch,0])square([mFrameThickness,mNotch]);
        translate([mFrameLength-mTabLength-mFrameThickness,mFrameWidth-mBeeSpace-mNotch,0])square([mFrameThickness,mNotch]);
        translate([mTabLength+mFrameThickness/2,(mFrameWidth-mBeeSpace)/2,0])circle(SmallNailHole);
        translate([mFrameLength-mTabLength-mFrameThickness/2,(mFrameWidth-mBeeSpace)/2,0])circle(SmallNailHole);
        translate([mFrameLength/2-mStarterLength/2,(mFrameWidth-mBeeSpace)/2-mStarterWidth/2,0]) square([mStarterLength,mStarterWidth]);
        if(FrameLength==19){
            translate([mFrameLength/2-mStarterLength/2-mStarterLength,(mFrameWidth-mBeeSpace)/2-mStarterWidth/2,0]) square([mStarterLength,mStarterWidth]);
            translate([mFrameLength/2-mStarterLength/2+mStarterLength,(mFrameWidth-mBeeSpace)/2-mStarterWidth/2,0]) square([mStarterLength,mStarterWidth]);
        }
    }
}
module FrontBack2d(IO,FB){
    difference() {
        square([mHiveHeight,mHiveWidth]);
        FJBothSides(mCornerFJ,mHiveThickness,mHiveHeight,LargeNailHole,true,mHiveWidth);
        translate([mHiveThickness-1,0,0])rotate([0,0,90]){
            FJ(mFrontBackFJ,mHiveThickness,mHiveWidth,LargeNailHole,false);
        }
        //Cut bottom finger joints off super
        square([mHiveThickness+mBeeSpace,mHiveWidth]);
        //Entrance
        if(FB=="Front")translate([40,mHiveWidth/2,0]) circle(12);
        if(FB=="Front"&&IO=="Outer")translate([(40+19),mHiveWidth/2,0]) circle(1);
        //Secondary entrance
//        if(FB=="Back"&&Type=="Base"&&NumFrames>4)translate([mHiveHeight-75,mHiveWidth/2,0]) circle(12);
//        if(FB=="Back"&&IO=="Outer"&&Type=="Base"&&NumFrames>4)translate([mHiveHeight-(75+19),mHiveWidth/2,0]) circle(1);
        //Hand Hold
        if(IO=="Outer"){
            translate([mHiveHeight-5,mHiveWidth/2,0]){
               difference(){
                   circle(50);
                   translate([-15,-50,0])square(100);
               }
            }
        }
        //Cut top for frame ledge
        if(IO=="Inner")translate([mHiveHeight-mFrameThickness-mBeeSpace,mHiveThickness+mBeeSpace,0])square([mFrameThickness+mBeeSpace,mHiveWidth-mHiveThickness*2-mBeeSpace*2]);
    }
    //Add tab to bottom to lock in super
    if(IO=="Inner"){
        translate([mHiveThickness,mHiveThickness+mBeeSpace,0]){
            difference(){
                length=mHiveWidth-mHiveThickness*2-mBeeSpace*2;
                square([mBeeSpace,length]);
                polygon([[0,0],[0,mBeeSpace/3],[mBeeSpace,0],[0,0]]);
                polygon([[0,length],[0,length-mBeeSpace/3],[mBeeSpace,length],[0,length]]);
            }
        }
    }
}
module Side2d(){
    difference() {
        square([mHiveHeight,mHiveLength]);
        FJBothSides(mCornerFJ,mHiveThickness*2,mHiveHeight,SmallNailHole,false,mHiveLength);
        translate([mHiveThickness-1,0,0])rotate([0,0,90])FJ(mSideFJ,mHiveThickness,mHiveLength,SmallNailHole,false);
        translate([mHiveHeight-mBeeSpace-SmallNailHole/2,mHiveThickness/2+SmallNailHole/2,0])circle(SmallNailHole);
        translate([mHiveHeight-mBeeSpace-SmallNailHole/2,mHiveLength-(mHiveThickness/2+SmallNailHole/2),0])circle(SmallNailHole);
        //Cut finger joint and bee space off super
        square([mHiveThickness+mBeeSpace,mHiveLength]);
        //Move Bottom nail hole on super
        translate([30,mHiveThickness/2-SmallNailHole/2,0])circle(SmallNailHole);
        translate([30,mHiveLength-(mHiveThickness/2-SmallNailHole/2),0])circle(SmallNailHole);
    }
    //plug old nail holes in super
            translate([mHiveThickness+mBeeSpace,0,0])square(mHiveThickness);
        translate([mHiveThickness+mBeeSpace,mHiveLength-mHiveThickness,0])square(mHiveThickness);
}
module Bottom2d(){
    difference() {
        square([mHiveWidth,mHiveLength]);
        FJBothSides(mFrontBackFJ,mHiveThickness*2,mHiveWidth,SmallNailHole,true,mHiveLength);
        translate([mHiveWidth,0,0])rotate([0,0,90]){
            FJBothSides(mSideFJ,mHiveThickness,mHiveLength,SmallNailHole,true,mHiveWidth);
        }
        // Drill new holes in half finger joint
        if(NumFrames>4){
            square([mHiveWidth/2,mHiveLength]);
            translate([mHiveWidth/2+mFrontBackFJ/4,mHiveThickness/2-SmallNailHole/2,0])circle(SmallNailHole);
            translate([mHiveWidth/2+mFrontBackFJ/4,mHiveLength-mHiveThickness/2-SmallNailHole/2,0])circle(SmallNailHole);
        }
    }
    //Patch 1/2 hole in 1/2 finger joint
    if(NumFrames>4){
        translate([mHiveWidth/2,mHiveThickness/2,0])square(SmallNailHole*3);
        translate([mHiveWidth/2,mHiveLength-mHiveThickness/2-SmallNailHole*1.5,0])square(SmallNailHole*3);
        }
}
module FJBothSides(FingerLength,FingerWidth,JointLength,Hole,Start,BoardWidth){
        FJ(FingerLength,FingerWidth,JointLength,Hole,Start);
        translate([0,BoardWidth+1,0]){
            rotate([180,0,0])FJ(FingerLength,FingerWidth,JointLength,Hole,Start);
        }
    }    
module FJ(FingerLength,FingerWidth,JointLength,Hole,Start){
    if(Start){
        for (x=[0:FingerLength*2:JointLength]){
            translate([x,0,0])square([FingerLength,FingerWidth]);
        }
        for (x=[FingerLength:FingerLength*2:JointLength]){
            translate([x+FingerLength/2,mHiveThickness/2-Hole/2,0])circle(Hole);
        }
    }
    else{
        for (x=[FingerLength:FingerLength*2:JointLength]){
            translate([x,0,0])square([FingerLength,FingerWidth]);
        }
        for (x=[0:FingerLength*2:JointLength]){
            translate([x+FingerLength/2,mHiveThickness/2-Hole/2,0])circle(Hole);
        }
    }
}
module TD(thickness){
    linear_extrude(thickness) children(); 
}    