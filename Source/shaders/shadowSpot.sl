light 
	shadowSpot(float intensity = 1, coneangle = radians(30), 
					 conedeltaangle = radians(5), beamdistribution = 2, 
					 samples = 16, blur = 0.01, bias = 0.01;
					 color lightcolor = 1; string shadowname = "";
					 point from = point "shader"(3,-3,0), to = point "shader" (0,0,0);
			    )
{
	uniform vector A = normalize(to - from);
	uniform float cosoutside = cos(coneangle);
	uniform float cosinside  = cos(coneangle - conedeltaangle);
	
	illuminate (from, A, coneangle)
	{
		float cosangle = (L . A) / length(L);
		float atten = pow(cosangle, beamdistribution) / (L . L);
		atten *= smoothstep(cosoutside, cosinside, cosangle);
		if( shadowname != "")
		{
			atten *= 1 - shadow(shadowname, Ps, "samples", samples, "blur", blur, "bias", bias);
		}
		Cl = atten * intensity * lightcolor;
	}


}