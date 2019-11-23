=begin

- XInput Patch v1.1
- Made by: Sixth
- Requires: RGD

This is just a small patch to integrate RGD's XInput controller checks for all
input checks in your project without the need to add in the new controller
checks for every single input check in every script of yours.

I don't recommend using this script if you are planning to use all of the
buttons from the XBOX controller, because, by default, only 8 buttons are
supported, but an XBOX controller (and most other controllers too nowadays) has
more.

It will only check for one controller input, the first one it detects.
Well, at least it should, but since I don't own an XBOX controller, I can't
really check if it works as intended or not.

Aside from the added XInput checks for your XBOX controller, the default input
checks are still working, so the keyboard checks and the default controller
checks will still operate as they did before adding this patch.

You can put this script anywhere on your script list.

=end

module XInput

  # Format:
  #
  #   :default_symbol => [:controller_symbol_1, :controller_symbol_2, ...],
  #
  # Don't change the default symbols!
  # You can change which controller button(s) will be assigned to the default
  # input checks by changing the controller symbols on the right side in the
  # arrays. The controllor symbols must be in an array!
  # All included controller buttons for a default symbol will do the same when
  # they are pressed.
  # Refer to the RGD documentation for the available controller symbols.
  #
  # You can add in custom symbols as default symbols too, but they won't do
  # anything until you actually check for that symbol in your input checks,
  # which the default scripts don't do, so I didn't include any here.
  Keys = {
   :DOWN  => [:DPAD_DOWN],   # DOWN
   :UP    => [:DPAD_UP],     # UP
   :LEFT  => [:DPAD_LEFT],   # LEFT
   :RIGHT => [:DPAD_RIGHT],  # RIGHT
   :A     => [:X],   # Dash key
   :B     => [:B],   # Cancel key
   :C     => [:A],   # Confirm key
   :L     => [:LEFT_SHOULDER, :LEFT_THUMB],    # Page Up
   :R     => [:RIGHT_SHOULDER, :RIGHT_THUMB],  # Page Down
   :X     => [:START],   # Not used by default - custom scripts may use it
   :Y     => [:Y],       # Not used by default - custom scripts may use it
   :Z     => [:BACK],    # Not used by default - custom scripts may use it
  }

end

# End of settings! Don't mess with the code below! Or do... I don't care. :p

class << Input

  attr_accessor :pref_ax, :dir4, :dir8

  @pref_ax = ''
  @dir4 = @dir8 = 0

  alias add_xinput9927 trigger?
  def trigger?(arg)
   return add_xinput9927(arg) || xinput_check("trigger?",arg)
  end

  alias add_xinput7724 press?
  def press?(arg)
    return add_xinput7724(arg) || xinput_check("press?",arg)
  end

  alias add_xinput1773 repeat?
  def repeat?(arg)
   return add_xinput1773(arg) || xinput_check("repeat?",arg)
  end

  def xinput_check(mtd,arg)
   control = Input::Controller.first_state || Input::Controller.states[0]
   return false unless XInput::Keys[arg]
   return XInput::Keys[arg].any? {|sym| control.send(mtd,sym) }
  end

  def update_dir
   xx = get_x
   yy = get_y
   @dir8 = num_dir(xx,yy)
   if xx != 0 && yy != 0
     if @pref_ax == 'x'
       yy = 0
     else
       xx = 0
     end
   elsif xx != 0
     @pref_ax = 'y'
   elsif yy != 0
     @pref_ax = 'x'
   end
   @dir4 = num_dir(xx,yy)
  end

  def get_x
   xx = 0
   xx -= 1 if press?(:LEFT)
   xx += 1 if press?(:RIGHT)
   return xx
  end

  def get_y
   yy = 0
   yy -= 1 if press?(:UP)
   yy += 1 if press?(:DOWN)
   return yy
  end

  def num_dir(x,y)
   if x != 0 || y != 0
     return 5 - y * 3 + x
   else
     return 0
   end
  end
  
  alias fix_dirs7761 update
  def update
   fix_dirs7761
   update_dir
  end

end
# END OF SCRIPT! O_O