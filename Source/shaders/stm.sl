surface stm(float Ka=1, Kd=1, Ks=1;
               float roughness = 0.1;
               color specularcolor = 1;
               string txName = "";
               float sstart = 0, sscale = 1;
               float tstart = 0, tscale = 1;)
{
	float sRepCount = 1;
	float tRepCount = 1;
	float ss = mod(s*sRepCount, 1);
	float tt = mod(t*tRepCount, 1);

	color Ct;
	if (txName != ""){
        Ct = color texture (txName, ss, tt);
	}else
		Ct = Cs;

  normal Nf = faceforward(normalize(N),I);
    vector V = -normalize(I);
    Ci = Ct * (Ka*ambient() + Kd*diffuse(Nf))+ Ks*specularcolor*specular(Nf,V,roughness);
    Oi = Os;  Ci *= Oi;
}