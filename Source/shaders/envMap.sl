surface envMap(string mapname = "")
{
	color surfaceType = color texture(mapname);
	Oi = Os;
	Ci = Oi * surfaceType;
}