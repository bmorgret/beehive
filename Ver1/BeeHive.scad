Display="Hive"; // ["Hive","Bottom","Side","OuterFront","InnerFront","OuterBack","InnerBack","Lid","Cleats","FrameTops","FrameBottoms","LidTemplate","Calibration","MiniNuc1","MiniNuc2","MiniNuc3","MiniNuc4","test"]
Type="Base"; // ["Base","Super"]
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

if(Display=="Hive") Hive();
if(Display=="Bottom") rotate([0,0,90])Bottom2d();
if(Display=="OuterFront") rotate([0,0,90])FrontBack2d("Outer","Front");
if(Display=="InnerFront") rotate([0,0,90])FrontBack2d("Inner","Front");
if(Display=="OuterBack") rotate([0,0,90])FrontBack2d("Outer","Back");
if(Display=="InnerBack") rotate([0,0,90])FrontBack2d("Inner","Back");
if(Display=="Side") rotate([0,0,90])Side2d();
if(Display=="Lid") Lid2d();
if(Display=="Cleats") {spacing=30;LidCleat2d(); translate([0,spacing,0]) LidCleat2d();translate([0,spacing*2,0]) LidCleat2d();translate([0,spacing*3,0]) LidCleat2d();translate([0,spacing*4,0]) LidCleat2d();translate([0,spacing*5,0]) LidCleat2d();}
if(Display=="FrameTops") {spacing=30;FrameTop2d(); translate([0,spacing,0]) FrameTop2d();translate([0,spacing*2,0]) FrameTop2d();translate([0,spacing*3,0]) FrameTop2d();translate([0,spacing*4,0]) FrameTop2d();translate([0,spacing*5,0]) FrameTop2d();} 
if(Display=="FrameBottoms") {spacing=30;FrameBottom2d();translate([0,spacing,0]) FrameBottom2d();translate([0,spacing*2,0]) FrameBottom2d();translate([0,spacing*3,0]) FrameBottom2d();translate([0,spacing*4,0]) FrameBottom2d();translate([0,spacing*5,0]) FrameBottom2d();}
if(Display=="LidTemplate") LidTemplate2d();
if(Display=="Calibration") {square([100,100]);}

//Platers
if(Display=="MiniNuc1"){
    translate([265+170,0,0])rotate([0,0,90])FrontBack2d("Outer","Front");
    translate([265,0,0])rotate([0,0,90])Side2d();
}
if(Display=="MiniNuc2"){
    translate([265+170,0,0])rotate([0,0,90])FrontBack2d("Inner","Front");
    translate([265,0,0])rotate([0,0,90])Side2d();
}
if(Display=="MiniNuc3"){
    translate([265+170,0,0])rotate([0,0,90])FrontBack2d("Outer","Back");
    translate([265,0,0])rotate([0,0,90])Lid2d();
}
if(Display=="MiniNuc4"){
    translate([265+170,0,0])rotate([0,0,90])FrontBack2d("Inner","Back");
    translate([265,0,0])rotate([0,0,90])Bottom2d();
}
if(Display=="test") {
    spacing=30;
    test(.5,.8); 
    translate([0,spacing,0]) test(.6,.9);
    translate([0,spacing*2,0]) test(.7,1);
    translate([0,spacing*3,0]) test(.8,1.1);
    translate([0,spacing*4,0]) test(.9,1.2);
    translate([0,spacing*5,0]) test(1,1.3);
    }
    
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

module test(mStarterWidth,SmallNailHole){
    mNotch=1/16*25.4;
    mStarterLength=4*25.4;
//    mStarterWidth=(1/32)*25.4;
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
    

module Hive(){
    if(Type=="Base") TD(mHiveThickness)Bottom2d();
    translate([0+mHiveThickness,0,0])rotate([0,-90,0]) TD(mHiveThickness)Side2d();
    translate([mHiveWidth,0,0])rotate([0,-90,0]) TD(mHiveThickness)Side2d();
    translate([0,0,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Outer","Front");
    translate([0,mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Inner","Front");
    translate([0,mHiveLength-mHiveThickness,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Outer","Back");
    translate([0,mHiveLength-mHiveThickness*2,0])rotate([0,-90,-90]) TD(mHiveThickness)FrontBack2d("Inner","Back");
    translate([mHiveThickness+mFrameWidth,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
    translate([mHiveThickness+mFrameWidth*2,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
    translate([mHiveThickness+mFrameWidth*3,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
    translate([mHiveThickness+mFrameWidth*4,mHiveThickness,mHiveHeight-mFrameThickness-mBeeSpace])rotate([0,0,90])TD(mFrameThickness)FrameTop2d();
}
module Lid2d(){
    difference(){
        square([mLidLength,mLidWidth]);
        if(NumFrames>4) square([mLidLength,mLidWidth/2]);
    }
}
module LidTemplate2d(){
    difference(){
        square([mLidLength,mLidWidth]);
        translate([mTabLength+mFrameThickness+(mLidLength-mHiveLength)/2+mHiveThickness*2,(mLidWidth-(mHiveWidth-mHiveThickness*2))/2,0])rotate([0,0,90])square([mHiveWidth-mHiveThickness*2,mTabLength+mFrameThickness]);
        translate([mLidLength-((mLidLength-mHiveLength)/2+mHiveThickness*2),(mLidWidth-(mHiveWidth-mHiveThickness*2))/2,0])rotate([0,0,90])square([mHiveWidth-mHiveThickness*2,mTabLength+mFrameThickness]);
    }
}
module LidCleat2d(){
    inset=(mTabLength+mFrameThickness)/2;
    difference(){
        square([mHiveWidth-mHiveThickness*2,mTabLength+mFrameThickness]);
        translate([inset,inset,0]) circle(ScrewHole);
        if(NumFrames<=4)translate([(mHiveWidth-mHiveThickness*2)/2,inset,0]) circle(ScrewHole);
        if(NumFrames>4){
            translate([(mHiveWidth-mHiveThickness*2)/2-inset,inset,0]) circle(ScrewHole);
            translate([(mHiveWidth-mHiveThickness*2)/2+inset,inset,0]) circle(ScrewHole);
            translate([(mHiveWidth-mHiveThickness*2)/4,inset,0]) circle(ScrewHole);
            translate([(mHiveWidth-mHiveThickness*2)/4*3,inset,0]) circle(ScrewHole);
        }
        translate([(mHiveWidth-mHiveThickness*2)-(mTabLength+mFrameThickness)/2,(mTabLength+mFrameThickness)/2,0]) circle(ScrewHole);
    }
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
        if(Type=="Super")square([mHiveThickness+mBeeSpace,mHiveWidth]);
        //Entrance
        if(FB=="Front"&&Type=="Base")translate([40,mHiveWidth/2,0]) circle(12);
        if(FB=="Front"&&IO=="Outer"&&Type=="Base")translate([(40+19),mHiveWidth/2,0]) circle(1);
        //Secondary entrance
        if(FB=="Back"&&Type=="Base"&&NumFrames>4)translate([mHiveHeight-75,mHiveWidth/2,0]) circle(12);
        if(FB=="Back"&&IO=="Outer"&&Type=="Base"&&NumFrames>4)translate([mHiveHeight-(75+19),mHiveWidth/2,0]) circle(1);
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
    if(IO=="Inner"&&Type=="Super"){
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
        if(Type=="Super")square([mHiveThickness+mBeeSpace,mHiveLength]);
        //Move Bottom nail hole on super
        if(Type=="Super")translate([30,mHiveThickness/2-SmallNailHole/2,0])circle(SmallNailHole);
        if(Type=="Super")translate([30,mHiveLength-(mHiveThickness/2-SmallNailHole/2),0])circle(SmallNailHole);
    }
    //plug old nail holes in super
            if(Type=="Super")translate([mHiveThickness+mBeeSpace,0,0])square(mHiveThickness);
        if(Type=="Super")translate([mHiveThickness+mBeeSpace,mHiveLength-mHiveThickness,0])square(mHiveThickness);
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