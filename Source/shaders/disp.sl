displacement _stdDisp(float Km = 0.1; string space ="object"; float trueDisp = 1;)
{
	normal _nn = normalize(N);
	float mag = 0;
	point PP;
	//calculate magnitude
	mag = sin(s*10*2*PI) * sin(t*10*2*PI);
	mag *= length(vtransform(space, _nn));
	
	//Displace
	PP = P + mag * Km * _nn;
	N = calculatenormal(-PP);
	if( trueDisp == 1 )
		P = PP;
	
}