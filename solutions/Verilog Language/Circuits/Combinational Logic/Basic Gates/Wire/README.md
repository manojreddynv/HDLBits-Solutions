# Wire

## Problem

<div class="mw-content-ltr mw-parser-output" lang="en" dir="ltr"><div style="border-bottom:2px #c6e9f2 solid; padding: 0.5ex 0 0 0; margin-top: -1ex; margin-bottom: 1em;"><div class="row" style="margin-bottom: 0;">
<div class="column small-6"><span style="white-space:nowrap; margin-left:1ex;"><span class="fa fa-arrow-left"></span><span style="padding: 0.5em 0 0.5em 0.5em;"><a href="https://hdlbits.01xz.net/wiki/zero" title="zero" class="vlgstat_link">zero<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="zero: Completed"></span></a><small class="show-for-medium-up" style="margin-left: 1.5em; color:#aaa;">Previous</small></span></span></div>
<div class="column small-6" style="text-align:right;"><span style="white-space:nowrap; margin-right:1ex;"><span style="padding: 0.5em 0.2em 0.5em 0;"><small class="show-for-medium-up" style="margin-right: 1.5em; color:#aaa;">Next</small><a href="https://hdlbits.01xz.net/wiki/wire4" title="wire4" class="vlgstat_link">wire4<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="wire4: Completed"></span></a></span><span class="fa fa-arrow-right"></span></span></div>
</div></div>
<p>Create a module with one input and one output that behaves like a wire.
</p><p>Unlike physical wires, wires (and other signals) in Verilog are <i>directional</i>. This means information flows in only one direction, from (usually one) <i>source</i> to the <i>sinks</i> (The source is also often called a <i>driver</i> that <i>drives</i> a value onto a wire). In a Verilog "continuous assignment" (<code>assign left_side = right_side;</code>), the value of the signal on the right side is driven onto the wire on the left side. The assignment is "continuous" because the assignment continues all the time even if the right side's value changes. A continuous assignment is not a one-time event.
</p><p>The ports on a module also have a direction (usually input or output). An input port is <i>driven by</i> something from outside the module, while an output port <i>drives</i> something outside. When viewed from inside the module, an input port is a driver or source, while an output port is a sink.
</p><p>The diagram below illustrates how each part of the circuit corresponds to each bit of Verilog code. The module and port declarations create the black portions of the circuit. Your task is to create a wire (in green) by adding an <code>assign</code> statement to connect <code>in</code> to <code>out</code>. The parts outside the box are not your concern, but you should know that your circuit is tested by connecting signals from our test harness to the ports on your <code>top_module</code>.
</p><p><br>
</p>
<figure class="mw-default-size mw-halign-center" typeof="mw:File"><a href="https://hdlbits.01xz.net/wiki/File:Wire.png" class="mw-file-description"><img src="/mw/images/7/77/Wire.png" decoding="async" width="811" height="328" class="mw-file-element"></a><figcaption></figcaption></figure>
<p><br>
In addition to continuous assignments, Verilog has three other assignment types that are used in procedural blocks, two of which are synthesizable. We won't be using them until we start using procedural blocks.
</p>
<i></i><p style="margin-top:1.4em;"><i><b>Expected solution length:</b> Around 1 line.</i></p><div id="portlistouterbox" class="hb-box"><h3>Module Declaration</h3>
<pre id="portlistbox">module top_module( input in, output out );</pre>
<pre style="display:none;"></pre></div>
<p class="mw-empty-elt"></p><div class="hb-box" id="hintbox">
<div style="border: 0; display: none; margin-top: 1ex;">

A <i>continuous</i> assignment assigns the right side to the left side <i>continuously</i>, so any change to the RHS is immediately seen in the LHS.</div></div>
<p class="mw-empty-elt"></p>
<div class="hb-box" id="submitbox">
<h3>Write your solution here</h3>
<div style="display: inline-block"><select id="uiload_select"><option disabled="" selected="" value="">[Load a previous submission]</option><option value="0">Last success: 16/08/2026, 03:24:59</option><option disabled="" value="null">Last non-success: none</option></select></div>		

<div class="hb-subbox">

<div id="sharelink"></div>
</div>
<a href="https://hdlbits.01xz.net/wiki/Wire#" onclick="$('#submituploaddiv').show(); $(this).hide(); return false;" style="font-size:80%; line-height: 80%; display: block;">Upload a source file... <i class="fa fa-angle-double-down" style="margin-left:0.5em; font-size:120%" aria-hidden="true"></i></a>
<div id="submituploaddiv" style="display:none;"><h3>Or upload a file</h3>
<div class="hb-subbox">

</div></div>



<link rel="stylesheet" href="/codemirror/lib/codemirror.css">
<link rel="stylesheet" href="/codemirror/theme/neat.css">



</div>



<div class="hb-box" id="solnbox" style="display: block;">
<h3>Solution</h3>
<div style="display:none; border: 1px #999 solid" id="solnbox_div"><textarea id="solnbox_box">Loading...</textarea></div></div>



<p>



</p>
<div style="border-top:2px #c6e9f2 solid; padding: 1ex 0 0 0; margin: 4em 0 2em 0;"><div class="show-for-medium-up" style="position:relative; height: 1.6em;"><div style="white-space:nowrap; text-align: center; font-size:0.67em; overflow:hidden; position:absolute; top:0.5ex; left:3em; right: 3em;">
<div style="position: relative; text-align: right; width: 0%; display:inline-block; vertical-align: top;">
<div style="position: absolute; right: 0; display: block; display:inline-block;">
<ul class="hlist" style="margin:0.2em 0 0 0;">
<li class="mw-empty-elt"></li>
<li class="mw-empty-elt"></li>
<li class="mw-empty-elt"></li>
<li class="mw-empty-elt"></li>
<li class="mw-empty-elt"></li>
<li class="mw-empty-elt"></li>
<li><a href="https://hdlbits.01xz.net/wiki/step_one" title="step_one" class="vlgstat_link">step_one<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="step_one: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/zero" title="zero" class="vlgstat_link">zero<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="zero: Completed"></span></a> · </li>
</ul></div>
</div><div style="display:inline-block; vertical-align: top;"><p style="margin:0 0.5em; font-size: 1.25em;"><b>wire<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="wire: Completed"></span></b></p></div>
<div style="width:0%; display:inline-block; text-align: left; ;vertical-align: top;">
<ul class="hlist" style="margin:0.2em 0 0 0;">
<li> · <a href="https://hdlbits.01xz.net/wiki/wire4" title="wire4" class="vlgstat_link">wire4<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="wire4: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/notgate" title="notgate" class="vlgstat_link">notgate<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="notgate: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/andgate" title="andgate" class="vlgstat_link">andgate<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="andgate: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/norgate" title="norgate" class="vlgstat_link">norgate<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="norgate: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/xnorgate" title="xnorgate" class="vlgstat_link">xnorgate<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="xnorgate: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/wire_decl" title="wire_decl" class="vlgstat_link">wire_decl<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="wire_decl: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/7458" title="7458" class="vlgstat_link">7458<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="7458: Completed"></span></a></li>
<li><a href="https://hdlbits.01xz.net/wiki/vector0" title="vector0" class="vlgstat_link">vector0<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="vector0: Completed"></span></a></li>
</ul>
</div>
</div></div><div class="row" style="margin-bottom: 0;">
<div class="column small-6"><span style="white-space:nowrap; margin-left:1ex;"><span class="fa fa-arrow-left"></span><span style="padding: 0.5em 0 0.5em 0.5em;"><a href="https://hdlbits.01xz.net/wiki/zero" title="zero" class="vlgstat_link">zero<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="zero: Completed"></span></a><small class="show-for-medium-up" style="margin-left: 1.5em; color:#aaa;">Previous</small></span></span></div>
<div class="column small-6" style="text-align:right;"><span style="white-space:nowrap; margin-right:1ex;"><span style="padding: 0.5em 0.2em 0.5em 0;"><small class="show-for-medium-up" style="margin-right: 1.5em; color:#aaa;">Next</small><a href="https://hdlbits.01xz.net/wiki/wire4" title="wire4" class="vlgstat_link">wire4<span class="fa fa-check-circle hdlbits-stat-icon hdlbits-stat-done" aria-hidden="true" title="wire4: Completed"></span></a></span><span class="fa fa-arrow-right"></span></span></div>
</div>
</div>
<!-- 
NewPP limit report
Cached time: 20260815220449
Cache expiry: 0
Reduced expiry: true
Complications: []
CPU time usage: 0.027 seconds
Real time usage: 0.032 seconds
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
100.00%    7.108      1 -total
 53.71%    3.818      1 Template:ProblemFooter
 42.47%    3.019      1 Template:NextPrevListBox
 22.18%    1.577      1 Template:ProblemHeader
 17.81%    1.266      2 Template:NextPrevBox
  8.88%    0.631      1 Template:SubmitBox
  7.65%    0.544      1 Template:PortlistBox
  4.84%    0.344      1 Template:HintBox
-->
</div>

---

**Source:** [HDLBits](https://hdlbits.01xz.net/wiki/Wire)
