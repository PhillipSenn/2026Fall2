<cfinclude template="/Inc/header.cfm">
<div class="card">
    <div class="card-body">
        <h1 class="card-title">Google Maps</h1>
        <p class="card-text">I thought I would document my journey
        of having ChatGPT create a Google map game for my students.
        </p>
        <ol>
        <li><a href="1.htm">Create a Map - Minimal Viable Product</a></li>
        <li><a href="2.htm">Add a sidebar showing the current zoom level</a></li>
        <li><a href="3.htm">Zoom level 3 - max!</a></li>
        <li><a href="4.htm">Add Twitter Bootstrap</a></li>
        <li><a href="5.htm">Add a marquee for in-game news, and hide the sidebar</a></li>
        <li><a href="6.htm">Use Unicode to represent a player, fly from one destination to another</a></li>
        <li><a href="7.cfm">Now use ColdFusion</a> (<a href="7.htm">Source</a>)</li>
        <li><a href="8.cfm">Add airports using SQL Server</a></li>
        <li><a href="9.cfm">Make airports clickable</a></li>
        <li>Define a player Unicode: 
            <form action="../../Unicode/player.cfm">
                <button name="id" class="btn-primary" value="19C76747-5CF9-449C-9A52-FEF8906AD52E">Player 1</button>
                <button name="id" class="btn-secondary" value="21E468EC-A70C-46F5-BB9F-5B5A21F7F32F">Player 2</button>
            </form>
        </li>
        <li>Todo: Multiple players
            <form action="11.cfm">
                <button type="button" class="btn-primary" disabled>Player 1</button>
                <button name="id" class="btn-secondary" value="21E468EC-A70C-46F5-BB9F-5B5A21F7F32F">Player 2</button>
            </form>
        </li>
        <li>Todo: Add commodities</li>
        <li>Todo: Allow players to buy/sell commodities at airports</li>
        </ol>
    </div>
</div>
<cfinclude template="/Inc/footer.cfm">