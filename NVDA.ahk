; Wrapper class around the NVDA Controller Client DLL
class NVDA
{
	; Path to the DLL, used in all the class methods below
	static DLL := A_ScriptDir . "\nvdaControllerClient32.dll"
	
	Say(text)
	{
		DllCall(this.DLL . "\nvdaController_speakText", Str, text)
	}
	
	Braille(text)
	{
		DllCall(this.DLL . "\nvdaController_brailleMessage", Str, text)
	}

	IsRunning()
	{
		NVDA_running := DllCall(this.DLL . "\nvdaController_testIfRunning")
		if (NVDA_running == 0){
			return true
		}else{
			return false
		}
	}

	CancelSpeech()
	{
		return DllCall(this.DLL . "\nvdaController_cancelSpeech")
	}
}