# NVScript - A simpler scripting language for NVDA

## Overview

I was hanging out with a friend one weekend when we got to talking about assistive tech scripting.  He's not a programmer,
but he used to do JAWS scripting all the time; then he switched to NVDA.  And I've seen it before in other places; there are people
who are not developers but can do JAWS scripting - and often *only* JAWS scripting.  Now I'm not a fan of proprietary scripting
languages, and no real programmer is IMO.  Most of us well-trained code monkeys want a "real" scripting language, like Python.
But for the average Joe, developing NVDA add-ons is a daunting task - not only do you need to know Python, you need to know how
to install and use all the other required software.  If you want a user interface, you probably also need to know the wxPython
library (which I don't... yet).  And if you want to get certain things done, you need to know Microsoft UI Automation (UIA).
But for JAWS users, there's a nice script editor that lists and then walks you through all the available functions.  There's
nothing else to download and install, and the whole experience is very newbie-friendly.  Now if given the choice, I'll choose
NVDA every time, but it's a lot harder to script.  There's a DLL that gives you access to the four most basic functions, but
if you want to do anything more advanced then you better get ready to study, study, study, hours of trial'n'error and tons of
experimenting.  I'm up for that kind of a challenge, cuz I'm a geek, but most people really aren't.  That's why I'm creating this.

The goals of NVScript are:
1. To help experienced JAWS script writers to transition to the wonderful world of NVDA :)
2. To help everyone else write scripts for their favorite screen reader :)

It is NOT meant to be:
* A replacement for JAWS scripting.  This is just for NVDA.
* A replacement for NVDA add-ons.  Add-ons are an important part of the program, and have better access to NVDA's settings and capabilities "out of the box".
* An exact replica of JAWS scripting for NVDA.  There will inevitably be differences between the two languages, though I do plan to make them similar.

## On the technical side

JAWS scripts are compiled into a proprietary binary format (.jsb I think), but NVScript is an interpreted language.  I'm writing the interpreter in AutoHotKey (AHK for short).
* I chose it over languages like Python because it's simpler to set up on Windows.  You don't have to install anything else.
* I chose it over language like C++ or C# because it has awesome APIs for automation and hotkeys, two wheels I'd rather not reinvent.  It can still access COM, .NET, DLLs etc.
* I thought about translating ("transpiling") NVScript into AHK and then compiling that to an EXE, but that could make debugging syntax errors a lot harder for users.  It also
means you need a bunch of EXEs running if you have more than one script; one interpreter running multiple scripts cuts down on resource usage (even if only a little).

## Roadmap

What I have currently is a proof-of-concept, which can parse script files and do a few things like sppeaking text or sending simulated keystrokes or mouse clicks.  This was my first mini-milestone, but I still have a long way to go.  In no particular order, I still have to accomplish the following:

1. Continue to improve on the interpreter.  It needs to be able to do all the same basic things a scripting language can do.  This includes support for variables, loops, arrays, functions, nested function calls, etc.
2. Continue adding built-in functions to the language.  These should be similar, if not identical, to their JAWS scripting equivalents.  Some functions (like setting rate) will not be possible unless the NVDA Controller Client DLL is updated to include them, but AHK can already do pretty much everything else.
3. Document the language - usually I save this to the end, but since this is an entire language I'll probably have to do it as I go.
4. Build an IDE.  JAWS scripting has one, so should NVScript

## Contributing

I know AutoHotKey is not a very well-known language (yet), but if you know it you're more than welcome to do that!  As Hellen Keller said, "Alone we can do so little; together we can do so much"!  The more the merrier - that's what's gonna make NVScript a thing.  Just fork it, code away, and submit a pull request.  

## License

Both NVDA and AutoHotKey use "GNU General Public License, version 2".  I'm not much of a legal beagle, really just a code monkey, so I'm not sure what that means in English other than "it's open source".  But since both use the same license, I think it's safe to assume that NVScript has the same license.