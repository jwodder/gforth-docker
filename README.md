[Gforth](http://www.gnu.org/software/gforth/) is the GNU implementation of
[Forth](https://en.wikipedia.org/wiki/Forth_(programming_language)), a
stack-based low-level programming language.  Documentation for Gforth is
available at http://www.complang.tuwien.ac.at/forth/gforth/Docs-html/.

This image contains the latest version of Gforth compiled from source and
includes support for [the C foreign function
interface](http://www.complang.tuwien.ac.at/forth/gforth/Docs-html/C-Interface.html) and disassembly with GDB.

Gforth source files defining extra features are located in
`/usr/share/gforth/$GFORTH_VERSION`.  This directory is in Gforth's default
search path, and so you just need to run, say, `include random.fs` to be able
to use `seed`, `rnd`, and `random`.

## Execution

Starting the image without any arguments puts you in interactive (REPL) mode,
which is often what you want:

    $ docker run -it jwodder/gforth

Alternatively, you can run a Forth script from your current directory as
follows:

    $ docker run -it -v "$PWD":/usr/src/myapp -w /usr/src/myapp jwodder/gforth gforth your-script.fs -e bye

Note that the `-e bye` at the end is needed to keep Gforth from entering
interactive mode once the script completes.

## Configuration

You can make Gforth always run certain commands on startup by adding the
commands to `/usr/share/gforth/site-forth/siteinit.fs`, either by mounting a
source file as a volume:

    $ docker run -v /path/to/my-gforth-customizations.fs:/usr/share/gforth/site-forth/siteinit.fs jwodder/gforth

or by copying the commands into a new derived image:

    FROM jwodder/gforth
    COPY my-gforth-customizations.fs /usr/share/gforth/site-forth/siteinit.fs
