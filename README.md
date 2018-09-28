# NVScript - A simpler scripting language for NVDA

## Overview

I was hanging out with a friend this weekend when we got to talking about assistive tech scripting.  He's not a programmer,
but he used to be able to do JAWS scripting all the time.  And I've seen it before in other places; there are guys (and gals)
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

1. First, I want to build a working proof-of-concept. I want it to be able to do everything the DLL can, and have some of the basic features of a scripting language: variables, loops, arrays, and functions.  That's about al JAWS scripting has (no classes, interfaces, generics, lambdas, etc.).  I'd lke its syntax to work similar to JAWS scripting, because of goal #1 above, but it doesn't necessarily have to be identical.  One important difference I'm planning on is how shortcuts work.  In JAWS scripting, shortcuts can only be set from the IDE; I do plan to have a nice IDE someday, but I really think that info should be in the code somewhere (at this point I'm thinking as a parameter in script declarations).
2. From there, I want to add some of the same functions that are in the JAWS scripting API.  It's been years since I wrote a JAWS
script, so I forget what those are, but I have access to JAWS at work and can look them up.  This will be an ongoing process, as JAWS scripting is always changing.  For example, I looked up an example recently and found its variable are strongly typed - I totally don't remember that! :)
3. But NVDA and AHK can do some things JAWS can't, so the next part would be to add some features not available in JAWS scripting.
4. And of course, I'll want to give it a nice user-friendly IDE for folks who need/want that.  At this point that's just a crazy dream, but I'm sure I'll get there eventually (especially if it's not just me working on it).

## Contributing

I know AutoHotKey is not a very well-known language (yet), but if you know it you're more than welcome to do that!  As Hellen Keller said, "Alone we can do so little; together we can do so much"!  The more the merrier - that's what's gonna make NVScript a thing.  Just fork it, code away, and submit a pull request.  

## License

Both NVDA and AutoHotKey use "GNU General Public License, version 2".  I'm not much of a legal beagle, more of a code monkey, so I'm not sure what that means in English other than "it's open source".  But since both use the same license, I think it's safe to assume that NVScript has the same license.