# Wire

## Problem

<div class="mw-content-ltr mw-parser-output" lang="en" dir="ltr"><div style="border-bottom:2px #c6e9f2 solid; padding: 0.5ex 0 0 0; margin-top: -1ex; margin-bottom: 1em;"><div class="row" style="margin-bottom: 0;">
<div class="column small-6"><span style="white-space:nowrap; margin-left:1ex;"><span style="padding: 0.5em 0 0.5em 0.5em;"><a href="/wiki/zero" title="zero" class="vlgstat_link">zero</a><small class="show-for-medium-up" style="margin-left: 1.5em; color:#aaa;">Previous</small></span></span></div>
<div class="column small-6" style="text-align:right;"><span style="white-space:nowrap; margin-right:1ex;"><span style="padding: 0.5em 0.2em 0.5em 0;"><small class="show-for-medium-up" style="margin-right: 1.5em; color:#aaa;">Next</small><a href="/wiki/wire4" title="wire4" class="vlgstat_link">wire4</a></span></span></div>
</div></div>
<p>Create a module with one input and one output that behaves like a wire.
</p><p>Unlike physical wires, wires (and other signals) in Verilog are <i>directional</i>. This means information flows in only one direction, from (usually one) <i>source</i> to the <i>sinks</i> (The source is also often called a <i>driver</i> that <i>drives</i> a value onto a wire). In a Verilog "continuous assignment" (<code>assign left_side = right_side;</code>), the value of the signal on the right side is driven onto the wire on the left side. The assignment is "continuous" because the assignment continues all the time even if the right side's value changes. A continuous assignment is not a one-time event.
</p><p>The ports on a module also have a direction (usually input or output). An input port is <i>driven by</i> something from outside the module, while an output port <i>drives</i> something outside. When viewed from inside the module, an input port is a driver or source, while an output port is a sink.
</p><p>The diagram below illustrates how each part of the circuit corresponds to each bit of Verilog code. The module and port declarations create the black portions of the circuit. Your task is to create a wire (in green) by adding an <code>assign</code> statement to connect <code>in</code> to <code>out</code>. The parts outside the box are not your concern, but you should know that your circuit is tested by connecting signals from our test harness to the ports on your <code>top_module</code>.
</p>
<figure class="mw-default-size mw-halign-center" typeof="mw:File"><a href="/wiki/File:Wire.png" class="mw-file-description"></a><figcaption></figcaption></figure>
<p><br>
In addition to continuous assignments, Verilog has three other assignment types that are used in procedural blocks, two of which are synthesizable. We won't be using them until we start using procedural blocks.
</p>
<i></i><p style="margin-top:1.4em;"><i><b>Expected solution length:</b> Around 1 line.</i></p><div id="portlistouterbox" class="hb-box"><h3>Module Declaration</h3>
<pre id="portlistbox">module top_module( input in, output out );</pre>
<pre style="display:none;"></pre></div>
<div class="hb-box" id="hintbox">
<div style="border: 0; display: none; margin-top: 1ex;">

A <i>continuous</i> assignment assigns the right side to the left side <i>continuously</i>, so any change to the RHS is immediately seen in the LHS.</div></div>





</div>

---

**Source:** [HDLBits](https://hdlbits.01xz.net/wiki/Wire)
