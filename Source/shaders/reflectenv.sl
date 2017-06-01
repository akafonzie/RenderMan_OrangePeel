surface reflect( float Ka = 1, Kd = .5, Ks = .4, Kr = .3, roughness = 1;
				 color specularcolor = 1;)
{
	normal Nf = faceforward(normalize(N), I);
	vector V = -normalize(I);
	color Ct;
	vector Rcurrent = reflect(I, Nf);
	vector RWorld = vtransform("world", Rcurrent);
	color Cr = color environment("envMap.tx", RWorld);
	Ct = Cs;
	Oi = Os;
	Ci = Oi * (Ct * (Ka * ambient() + Kd * diffuse(Nf))+ 
			  specularcolor * (Ks * specular(Nf, V, roughness) + 
			  Kr * Cr ));
	
}