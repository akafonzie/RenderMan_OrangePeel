normal
	disp(vector dir; string space; float amp, trueDisp;)
{
	extern point P;
	float spacescale = length(vtransform(space, dir));
	vector Ndisp = dir * (amp / spacescale);
	P+= trueDisp * Ndisp;
	return normalize(calculatenormal(P + (1-trueDisp)*Ndisp));
}

displacement 
	dispPlz(string textureName = "", dispSpace = "shader"; 
			float Km = 1, trueDisp = 1, sstart = 0, sscale = 1,
			tstart = 0, tscale = 1, blur = 0, pAmp = 1;)
{
	if(textureName != "")
	{
		float ss = (s - sstart) / sscale;
		float tt = (t - tstart) / tscale;
		float amp = float texture(textureName[0], ss, tt, "swidth", 1, "twidth", .5);
		float namp = float noise(amp);
		N  = disp(normalize(N), dispSpace,-Km * amp, trueDisp);
	}
}
			