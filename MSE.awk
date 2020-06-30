# we run 10 processes thats why epected value in 
# percentage is 100/10=10. Because we expected all 
# process is sharing resource equal number of percentage
BEGIN{count=0; expected=100/2; sum=0;flag=0} 
{

if (substr($13,1,1) != "P") {flag=0}
if(flag) {
	sum = sum+($9-expected)*($9-expected)
	count = count+1

	#print "******************************"
	#print "$9:",$9
	#print "sum:",sum
	#print "count",count
	#print "******************************"
}
if($9=="STAT") {flag=1}

}
END{print("mse:",sum/count)}
