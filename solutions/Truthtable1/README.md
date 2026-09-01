# Truthtable1

## Problem

<div class="mw-content-ltr mw-parser-output" lang="en" dir="ltr"><div style="border-bottom:2px #c6e9f2 solid; padding: 0.5ex 0 0 0; margin-top: -1ex; margin-bottom: 1em;"><div class="row" style="margin-bottom: 0;">
<div class="column small-6"><span style="white-space:nowrap; margin-left:1ex;"><span style="padding: 0.5em 0 0.5em 0.5em;"><a href="/wiki/7420" title="7420" class="vlgstat_link">7420</a><small class="show-for-medium-up" style="margin-left: 1.5em; color:#aaa;">Previous</small></span></span></div>
<div class="column small-6" style="text-align:right;"><span style="white-space:nowrap; margin-right:1ex;"><span style="padding: 0.5em 0.2em 0.5em 0;"><small class="show-for-medium-up" style="margin-right: 1.5em; color:#aaa;">Next</small><a href="/wiki/mt2015_eq2" title="mt2015_eq2" class="vlgstat_link">mt2015_eq2</a></span></span></div>
</div></div>
<p>In the previous exercises, we used simple logic gates and combinations of several logic gates. These circuits are examples of <i>combinational</i> circuits. Combinational means the outputs of the circuit is a function (in the mathematics sense) of only its inputs. This means that for any given input value, there is only one possible output value. Thus, one way to describe the behaviour of a combinational function is to explicitly list what the output should be for every possible value of the inputs. This is a truth table.
</p><p>For a boolean function of N inputs, there are 2<sup>N</sup> possible input combinations. Each row of the truth table lists one input combination, so there are always 2<sup>N</sup> rows. The output column shows what the output should be for each input value.
</p>
<table style="border-collapse:collapse">

<tbody><tr class="toprule">
<th>Row
</th>
<td colspan="3" class="col4"><i>Inputs</i></td>
<td><i>Outputs</i>
</td></tr>
<tr class="bottomrule">
<th>number</th>
<th>x3</th>
<th>x2</th>
<th>x1</th>
<th>f
</th></tr>
<tr>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0</td>
<td>0
</td></tr>
<tr>
<td>1</td>
<td>0</td>
<td>0</td>
<td>1</td>
<td>0
</td></tr>
<tr>
<td>2</td>
<td>0</td>
<td>1</td>
<td>0</td>
<td>1
</td></tr>
<tr>
<td>3</td>
<td>0</td>
<td>1</td>
<td>1</td>
<td>1
</td></tr>
<tr>
<td>4</td>
<td>1</td>
<td>0</td>
<td>0</td>
<td>0
</td></tr>
<tr>
<td>5</td>
<td>1</td>
<td>0</td>
<td>1</td>
<td>1
</td></tr>
<tr>
<td>6</td>
<td>1</td>
<td>1</td>
<td>0</td>
<td>0
</td></tr>
<tr class="bottomrule">
<td>7</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1
</td></tr></tbody></table>
<p>The above truth table is for a three-input, one-output function. It has 8 rows for each of the 8 possible input combinations, and one output column. There are four inputs combinations where the output is 1, and four where the output is 0.
</p>
<h3><span class="mw-headline" id="Synthesizing_a_circuit_from_a_truth_table">Synthesizing a circuit from a truth table</span></h3>
<p>Suppose we want to build the above circuit, but we're limited to using only the set of standard logic gates.
How would you build arbitrary logic functions (expressed as a truth table)?
</p><p>One simple method to create a circuit that implements the truth table's function is to express the function in sum-of-products form. <b>Sum</b> (meaning OR) of <b>products</b> (meaning AND) means using one <i>N</i>-input AND gate per row of the truth table (to detect when the input matches each row), followed by an OR gate that chooses only those rows that result in a '1' output.
</p><p>For the above example, the output is '1' if the input matches row 2 <b>or</b> row 3 <b>or</b> row 5 <b>or</b> row 7 (This is a 4-input OR gate). The input matches row 2 if x3=0 <b>and</b> x2=1 <b>and</b> x1=0 (This is a 3-input AND gate). Thus, this truth table can be implemented in <abbr title="standard">canonical</abbr> form by using 4 AND gates that are ORed together.
</p>
<h2><span class="mw-headline" id="A_Bit_of_Practice">A Bit of Practice</span></h2>
<p>Create a combinational circuit that implements the above truth table.
</p>
<figure class="mw-default-size mw-halign-center" typeof="mw:File"><a href="/wiki/File:Truthtable1.png" class="mw-file-description"></a><figcaption></figcaption></figure>
<i></i>










<!-- 
NewPP limit report
Cached time: 20260901173558
Cache expiry: 0
Reduced expiry: true
Complications: []
CPU time usage: 0.042 seconds
Real time usage: 0.045 seconds
Preprocessor visited node count: 228/1000000
Post‐expand include size: 7366/2097152 bytes
Template argument size: 452/2097152 bytes
Highest expansion depth: 7/100
Expensive parser function count: 0/100
Unstrip recursion depth: 0/20
Unstrip post‐expand size: 13326/5000000 bytes
-->
<!--
Transclusion expansion time report (%,ms,calls,template)
100.00%    6.469      1 -total
 53.75%    3.477      1 Template:ProblemFooter
 41.18%    2.664      1 Template:NextPrevListBox
 24.27%    1.570      1 Template:ProblemHeader
 17.36%    1.123      2 Template:NextPrevBox
 11.51%    0.745      1 Template:SubmitBox
  7.17%    0.464      1 Template:PortlistBox
-->
</div>

---

**Source:** [HDLBits](https://hdlbits.01xz.net/wiki/Truthtable1)
