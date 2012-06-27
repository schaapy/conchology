## Conchology ##

It's all about shells. Get it?

Really, this is just a friendlier wrapper around Open4, because Open4 is
pretty bloody great, but feels like a real pain to actually use. Sometimes,
it just plain makes more sense to call out to the pipeline than it does to
try to use Ruby for shell scripting. When that happes, we use Conchology.

Granted, Conchology doesn't provide the full Open4 API just yet, because we
haven't needed it. Instead, we craft the commands that we run through
Concholog::Command in a fire-and-forget manner so we don't have to worry about
interactive processes.

### Command ###

The Conchology::Command class must be initialized with a string, the command
that you want to run in the shell. This can be just about anything, really,
but your best bet is to use absolute paths, so on. Here's a crap example:

    truecmd = Conchology::Command.new('true')

Once you initialize the command, you can run it, and that will set up the
object readers (output, error, and exitstatus).

    truecmd.run
    truecmd.exitstatus # An integer representing the exit status of the command
    truecmd.output # The split(/\n)'d stdpit output of the command
    truecmd.error # The split(/\n)'d stderr output of the command

If you attempt to grab info from these readers before you run the command,
nothing particularly nasty will happen. The exit status will be -1, and the
output and error will both be empty arrays.

But ... what if you don't want to actually instantiate it, but really do want
to do as close to a fire-and-forget as you can get without being a negligent
admin? Use the class-level run method!

    trueresults = Conchology::Command.run('true')

This returns a hash that contains :exitstatus, :output, and :error entries that
are as described above.

That's all there is to it right now. Enjoy!
