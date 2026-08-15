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
<i></i>












<!-- 
NewPP limit report
Cached time: 20260815230655
Cache expiry: 0
Reduced expiry: true
Complications: []
CPU time usage: 0.027 seconds
Real time usage: 0.030 seconds
Preprocessor visited node count: 237/1000000
Post‐expand include size: 6945/2097152 bytes
Template argument size: 334/2097152 bytes
Highest expansion depth: 7/100
Expensive parser function count: 0/100
Unstrip recursion depth: 0/20
Unstrip post‐expand size: 11773/5000000 bytes
-->
<!--
Transclusion expansion time report (%,ms,calls,template)
100.00%    6.326      1 -total
 49.79%    3.150      1 Template:ProblemFooter
 39.60%    2.505      1 Template:NextPrevListBox
 22.81%    1.443      1 Template:ProblemHeader
 17.22%    1.089      2 Template:NextPrevBox
 10.02%    0.634      1 Template:SubmitBox
  9.74%    0.616      1 Template:PortlistBox
  4.59%    0.290      1 Template:HintBox
-->
</div>

---

**Source:** [HDLBits](https://hdlbits.01xz.net/wiki/Wire)
