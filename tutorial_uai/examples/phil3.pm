// randomized dining philosophers [LR81]
// dxp/gxn 12/12/99

dtmc

// atomic formulae
// left fork free and right fork free resp.
formula lfree = (p2>=0&p2<=4)|p2=6|p2=10;
formula rfree = (p3>=0&p3<=3)|p3=5|p3=7|p3=11;

module phil1

	p1: [0..11];

	[] p1=0 -> (p1'=0); // stay thinking
	[] p1=0 -> (p1'=1); // trying
	[] p1=1 -> 0.5 : (p1'=2) + 0.5 : (p1'=3); // draw randomly
	[] p1=2 &  lfree -> (p1'=4); // pick up left
	[] p1=2 &  !lfree -> (p1'=2); // left not free
	[] p1=3 &  rfree -> (p1'=5); // pick up right
	[] p1=3 &  !rfree -> (p1'=3); // right not free
	[] p1=4 &  rfree -> (p1'=8); // pick up right (got left)
	[] p1=4 & !rfree -> (p1'=6); // right not free (got left)
	[] p1=5 &  lfree -> (p1'=8); // pick up left (got right)
	[] p1=5 & !lfree -> (p1'=7); // left not free (got right)
	[] p1=6  -> (p1'=1); // put down left
	[] p1=7  -> (p1'=1); // put down right
	[] p1=8  -> (p1'=9); // move to eating (got forks)
	[] p1=9  -> (p1'=10); // finished eating and put down left
	[] p1=9  -> (p1'=11); // finished eating and put down right
	[] p1=10 -> (p1'=0); // put down right and return to think
	[] p1=11 -> (p1'=0); // put down left and return to think

endmodule

// construct further modules through renaming
module phil2 = phil1 [ p1=p2, p2=p3, p3=p1 ] endmodule
module phil3 = phil1 [ p1=p3, p2=p1, p3=p2 ] endmodule

// rewards (number of steps)
rewards "num_steps"
	[] true : 1;
endrewards

// formulae
formula hungry1 = (p1>0)&(p1<8);
formula hungry2 = (p2>0)&(p2<8);
formula hungry3 = (p3>0)&(p3<8);
formula eat1 = (p1>=8)&(p1<=9);
formula eat2 = (p2>=8)&(p2<=9);
formula eat3 = (p3>=8)&(p3<=9);
formula no_hungry = (hungry1?1:0)+(hungry2?1:0)+(hungry3?1:0);
formula no_eat = (eat1?1:0)+(eat2?1:0)+(eat3?1:0);


// labels
label "hungry" = no_hungry>0;
label "eat" = no_eat>0;


