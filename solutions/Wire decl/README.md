# Wire decl

## Problem

<div class="mw-content-ltr mw-parser-output" lang="en" dir="ltr"><div style="border-bottom:2px #c6e9f2 solid; padding: 0.5ex 0 0 0; margin-top: -1ex; margin-bottom: 1em;"><div class="row" style="margin-bottom: 0;">
<div class="column small-6"><span style="white-space:nowrap; margin-left:1ex;"><span style="padding: 0.5em 0 0.5em 0.5em;"><a href="/wiki/xnorgate" title="xnorgate" class="vlgstat_link">xnorgate</a><small class="show-for-medium-up" style="margin-left: 1.5em; color:#aaa;">Previous</small></span></span></div>
<div class="column small-6" style="text-align:right;"><span style="white-space:nowrap; margin-right:1ex;"><span style="padding: 0.5em 0.2em 0.5em 0;"><small class="show-for-medium-up" style="margin-right: 1.5em; color:#aaa;">Next</small><a href="/wiki/7458" title="7458" class="vlgstat_link">7458</a></span></span></div>
</div></div>
<h2><span class="mw-headline" id="Declaring_wires">Declaring wires</span></h2>
<p>The circuits so far have been simple enough that the outputs are simple functions of the inputs. As circuits become more complex, you will need wires to connect internal components together. When you need to use a wire, you should declare it in the body of the module, somewhere before it is first used. (In the future, you will encounter more types of signals and variables that are also declared the same way, but for now, we'll start with a signal of type <tt>wire</tt>).
</p>
<h3><span class="mw-headline" id="Example">Example</span></h3>
<figure class="mw-default-size mw-halign-center" typeof="mw:File"><a href="/wiki/File:Wiredecl1.png" class="mw-file-description"></a><figcaption></figcaption></figure>

<div class="mw-highlight mw-highlight-lang-verilog mw-content-ltr" dir="ltr"><pre><span class="k">module</span><span class="n">top_module</span><span class="p">(</span>
<span class="k">input</span><span class="n">in</span><span class="p">,</span><span class="c1">// Declare an input wire named "in"</span>
<span class="k">output</span><span class="n">out</span><span class="c1">// Declare an output wire named "out"</span>
<span class="p">);</span>

<span class="kt">wire</span><span class="n">not_in</span><span class="p">;</span><span class="c1">// Declare a wire named "not_in"</span>

<span class="k">assign</span><span class="n">out</span><span class="o">=</span><span class="o">~</span><span class="n">not_in</span><span class="p">;</span><span class="c1">// Assign a value to out (create a NOT gate).</span>
<span class="k">assign</span><span class="n">not_in</span><span class="o">=</span><span class="o">~</span><span class="n">in</span><span class="p">;</span><span class="c1">// Assign a value to not_in (create another NOT gate).</span>

<span class="k">endmodule</span><span class="c1">// End of module "top_module"</span>
</pre></div>
<p>In the above module, there are three wires (<tt>in</tt>, <tt>out</tt>, and <tt>not_in</tt>), two of which are already declared as part of the module's input and output ports (This is why you didn't need to declare any wires in the earlier exercises). The wire <tt>not_in</tt> needs to be declared inside the module. It is not visible from outside the module. Then, two NOT gates are created using two <tt>assign</tt> statements. Note that it doesn't matter which of the NOT gates you create first: You still end up with the same circuit.
</p>
<h2><span class="mw-headline" id="Practice">Practice</span></h2>
<p>Implement the following circuit. Create two intermediate wires (named anything you want) to connect the AND and OR gates together. Note that the wire that feeds the NOT gate is really wire <tt>out</tt>, so you do not necessarily need to declare a third wire here. Notice how wires are driven by exactly one source (output of a gate), but can feed multiple inputs. 
</p><p>If you're following the circuit structure in the diagram, you should end up with four assign statements, as there are four signals that need a value assigned.
</p><p><small>(Yes, it is possible to create a circuit with the same functionality without the intermediate wires.)</small>
</p>
<figure class="mw-default-size mw-halign-center" typeof="mw:File"><a href="/wiki/File:Wiredecl2.png" class="mw-file-description"></a><figcaption></figcaption></figure>

<i></i>










<!-- 
NewPP limit report
Cached time: 20260820094633
Cache expiry: 0
Reduced expiry: true
Complications: []
CPU time usage: 0.038 seconds
Real time usage: 0.043 seconds
Preprocessor visited node count: 251/1000000
Post‐expand include size: 7524/2097152 bytes
Template argument size: 362/2097152 bytes
Highest expansion depth: 7/100
Expensive parser function count: 1/100
Unstrip recursion depth: 0/20
Unstrip post‐expand size: 14633/5000000 bytes
-->
<!--
Transclusion expansion time report (%,ms,calls,template)
100.00%   10.638      1 -total
 41.32%    4.396      1 Template:ProblemFooter
 32.27%    3.433      1 Template:NextPrevListBox
 16.91%    1.799      1 Template:ProblemHeader
 14.33%    1.525      2 Template:NextPrevBox
 12.15%    1.293      1 Template:SubmitBox
  7.88%    0.838      1 Template:PortlistBox
-->
</div>

---

**Source:** [HDLBits](https://hdlbits.01xz.net/wiki/Wire decl)
