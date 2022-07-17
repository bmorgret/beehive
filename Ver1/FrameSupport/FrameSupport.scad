BeeSpace=3/8;
FrameWidth=1+3/8;
TabLength=5/8;
Scale=1;

mBeeSpace=BeeSpace*25.4*Scale;
mFrameWidth=FrameWidth*25.4*Scale;
mTabLength=TabLength*25.4*Scale;


translate([mBeeSpace,0,0])cube([mFrameWidth+mBeeSpace,mTabLength*2,mBeeSpace]);
translate([0,0,mBeeSpace*2])cube([mBeeSpace*2,mTabLength*2,mBeeSpace/2]);
translate([mFrameWidth+mBeeSpace,0,mBeeSpace*2])cube([mBeeSpace*2,mTabLength*2,mBeeSpace/2]);
translate([mBeeSpace,0,0])cube([mBeeSpace,mTabLength*2,mBeeSpace*2.5]);
translate([mFrameWidth+mBeeSpace,0,0])cube([mBeeSpace,mTabLength*2,mBeeSpace*2.5]);
