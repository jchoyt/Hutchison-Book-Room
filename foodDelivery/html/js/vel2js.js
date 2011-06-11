function v2js_announcements(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
for (var i1=0;  i1<context.announce.length; i1++) {
var a = context.announce[i1];
velocityCount = i1;
t.p('    <h3 class="');
t.p( a.type);
t.p('">');
t.p( a.message);
t.p('</h3>');
}
velocityCount = 0;
return t.toString();
}
function v2js_attacklist(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
for (var i1=0;  i1<context.occs.length; i1++) {
var occ = context.occs[i1];
velocityCount = i1;
t.p('    <option value="');
t.p( occ.id);
t.p('">');
t.p( occ.name);
t.p('</option>');
}
velocityCount = 0;
t.p('.');
return t.toString();
}
function v2js_equiplist(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
for (var i1=0;  i1<context.inv.length; i1++) {
var i = context.inv[i1];
velocityCount = i1;
t.p('    ');
if (i.type == "weapon") {
t.p('        ');
if (i.equipped) {
t.p('            <option value="');
t.p( i.itemid);
t.p('" selected="true">');
t.p( i.name);
t.p(' (');
t.p( i.condition);
t.p(') (');
t.p( i.ammoleft);
t.p(')</option>        ');
}
else {
t.p('            <option value="');
t.p( i.itemid);
t.p('">');
t.p( i.name);
t.p(' (');
t.p( i.condition);
t.p(') (');
t.p( i.ammoleft);
t.p(')</option>        ');
}
t.p('    ');
}
}
velocityCount = 0;
t.p('.');
return t.toString();
}
function v2js_inventory(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
for (var i1=0;  i1<context.inv.length; i1++) {
var i = context.inv[i1];
velocityCount = i1;
t.p('<tr>    ');
if (i.type == "weapon" || i.type == "armor") {
t.p('        <td>');
t.p( i.name);
t.p(' (');
t.p( i.condition);
t.p(') (');
t.p( i.ammoleft);
t.p(')</td>    ');
}
else {
t.p('        <td>');
t.p( i.name);
t.p('</td>    ');
}
t.p('    <td>');
t.p( i.wt);
t.p('</td>    ');
if (i.type == "food") {
t.p('    <td><a href="');
t.p('#" onclick="eat(');
t.p( i.itemid);
t.p(')">Eat</a> | <a href="');
t.p('#" onclick="drop(');
t.p( i.itemid);
t.p(');">Drop</a></td>    ');
}
else {
if (i.type == "booze") {
t.p('    <td><a href="');
t.p('#" onclick="drink(');
t.p( i.itemid);
t.p(')">Drink</a> | <a href="');
t.p('#" onclick="drop(');
t.p( i.itemid);
t.p(');">Drop</a></td>    ');
}
else {
if (i.type == "weapon") {
t.p('        ');
if (i.equipped) {
t.p('            <td><a href="unequip.jsp?weaponid=');
t.p( i.itemid);
t.p('" >Unequip</a></td>        ');
}
else {
t.p('            <td><a href="equip.jsp?weaponid=');
t.p( i.itemid);
t.p('" >Equip</a> | <a href="');
t.p('#" onclick="drop(');
t.p( i.itemid);
t.p(');">Drop</a></td>        ');
}
t.p('    ');
}
else {
t.p('    <td><a href="');
t.p('#" onclick="drop(');
t.p( i.itemid);
t.p(');">Drop</a></td>    ');
}
}
}
t.p('</tr>');
}
velocityCount = 0;
return t.toString();
}
function v2js_messages(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
for (var i1=0;  i1<context.msgs.length; i1++) {
var msg = context.msgs[i1];
velocityCount = i1;
t.p('    <li><span class="read-');
t.p( msg.read);
t.p('"><span class="');
t.p( msg.type);
t.p('">    ');
if (msg.reps > 1) {
t.p('        ( ');
t.p( msg.reps);
t.p(' times )    ');
}
t.p('    ');
t.p( msg.text);
t.p(' ( ');
t.p( msg.date);
t.p(' )</span></span></li>');
}
velocityCount = 0;
return t.toString();
}
function v2js_occupants(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
for (var i1=0;  i1<context.occs.length; i1++) {
var occ = context.occs[i1];
velocityCount = i1;
t.p('<tr>    <td><a href="/viewCharacter.jsp?id=');
t.p( occ.id);
t.p('">');
t.p( occ.name);
t.p('</a></td>    <td>');
t.p( occ.level);
t.p('</td>    <td><img alt="" src="/i/hp-');
t.p( occ.hp);
t.p('.png"/></td>    <td><a href="');
t.p('#" onmouseover="showtarget(');
t.p( occ.id);
t.p(')">>></a><span style="display:none" id="desc-');
t.p( occ.id);
t.p('"><a href="');
t.p('#" onclick="attack(');
t.p( occ.id);
t.p(')">Attack ');
t.p( occ.name);
t.p('</a></span></td></tr>');
}
velocityCount = 0;
return t.toString();
}
function v2js_stats(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
t.p('<span class="hp">HP: ');
t.p( context.stats.hp);
t.p('</span><span class="ip">IP: ');
t.p( context.stats.ip);
t.p('</span><span class="ap">AP: ');
t.p( context.stats.ap);
t.p('</span>');
return t.toString();
}
function v2js_stats2(context) { 
var t = new StringCat();
var velocityCount = 0;
if (context.velocityCount) velocityCount=context.velocityCount;
var da = ( context.stats.ticksalive / 96 );
t.p('Days alive: ');
t.p( da);
t.p('<br/><span class="hp">HP: ');
t.p( context.stats.hp);
t.p('</span><br/><span class="ip">IP: ');
t.p( context.stats.ip);
t.p('</span><br/><span class="ap">AP: ');
t.p( context.stats.ap);
t.p('</span><br/><span class="xp">XP: ');
t.p( context.stats.xp);
t.p('</span>');
return t.toString();
}
