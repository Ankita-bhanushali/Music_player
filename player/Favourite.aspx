<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Favourite.aspx.cs" Inherits="player.Favourite" %>
<%@ Import Namespace="player" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="#" />

    <title></title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Ubuntu&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Varela+Round&display=swap');

        body {
            background-color: antiquewhite;
        }

        * {
            margin: 0;
            padding: 0;
        }

        .auto-style1 {
            width: 300px;
        }

        .auto-style2 {
            text-align: center;
        }

        nav {
            font-family: 'Ubuntu', sans-serif;
            display: flex;
            align-items: center;
            list-style-type: none;
            text-align: right;
            height: 45px;
            background-color: darkslategray;
            color: white;
            padding-top: 10px;
            padding-left: 20px;
            padding-right: 20px;
        }

        .container {
            min-height: 72vh;
            background-color: black;
            color: white;
            font-family: 'Varela Round', sans-serif;
            display: flex;
            margin: 23px auto;
            width: 85%;
            border-radius: 12px;
            padding: 34px;
            background-image: url("bg.jpg");
            background-size: cover;
        }

        .songitem {
            height: 139px;
            display: flex;
            background-color: white;
            color: black;
            margin: 23px 20px 20px 20px;
            justify-content: space-between;
            align-items: center;
            border-radius: 34px;
            flex-direction: column;
            width: 300px;
        }

        .bottom {
            position: sticky;
            bottom: 0;
            height: 81px;
            background-color: black;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 8px;
        }

        .icons {
            justify-content:center;
            column-gap: 50px;
            font-size: medium;
        }

            .icons i {
                cursor: pointer;
            }

        .slider_container {
            width: 80vw;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 47px;
        }

        .seek_slider {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            height: 5px;
            background: black;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
        }

            /* Modify the appearance of the slider thumb */
            .seek_slider::-webkit-slider-thumb {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                width: 15px;
                height: 15px;
                background: white;
                cursor: pointer;
                border-radius: 50%;
            }

            /* Change the opacity when mouse is hovered */
            .seek_slider:hover,
            .volume-slider:hover {
                opacity: 1.0;
            }

        .volume-slider-con {
            height: 11px;
            width: 15%;
            position: absolute;
            background-color: #ddd;
            margin-right: 15px;
            justify-content: right;
            margin-top: 10px;
            right: 10vw;
        }

        .volume-slider {
            height: 100%;
            width: 100%;
            opacity: 0.7;
            position: relative;
            background-color: #171866;
            top: 0px;
            left: -3px;
        }

        .current-time,
        .total-duration {
            padding: 10px;
            width: 48px;
            height: 23px;
        }

        .auto-style4 {
            height: 55px;
            width: 30px;
        }

        .songInfo {
            margin-top: 10px;
            position: absolute;
            left: 10vw;
            font-family: 'Varela Round', sans-serif;
        }

            .songInfo image {
                opacity: 0;
                transition: opacity 0.4s ease-in;
            }

        #seek_slider {
            width: 761px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server">
            <nav>
                
                &nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Back" />
                &nbsp;<asp:Button ID="Button3" runat="server" Text="Log Out" OnClick="Button3_Click" />
            </nav>
        </asp:Panel>
        <div>
        </div>
        

        <asp:Panel ID="Panel2" runat="server" CssClass="container" ScrollBars="Horizontal">
            <br />
           
            <div>
                <script type="text/javascript">
                    var songs = new Array();
                   

                </script>
               
                <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CC9966"  BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Both" CssClass="songitem">
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <ItemStyle BackColor="White" ForeColor="#330099" />
                    <ItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style4">
                                    <table class="auto-style1">
                                        <tr>
                                            <td class="auto-style2">
                                                <span class="songName">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("music_name") %>' ForeColor="Black"></asp:Label>
                                            </span> </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("singer") %>' ForeColor="Black"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                               <td class="auto-style4 songlistplay" style="text-align: center">
                                    
                                        <i class="far songItemPlay fa-play-circle"></i>
                                    <audio id="myaudio" src='Handler1.ashx?ID=<%# Eval("ID") %>' type="audio/mpeg">
                                    </audio>
                                    <script type="text/javascript">
                                        var z = 'Handler1.ashx?ID=<%# Eval("ID") %>';
                                        var y = '<%# Eval("music_name") %>';
                                        songs.push({
                                            songName: y,
                                            filePath: z
                                        });
                                    </script>
                                </td>
                                <td>
                                    <asp:Imagebutton ID="ImageButton2" runat="server" Height="22px"  CommandArgument='<%# Eval("music_name")%>' OnCommand="ImageButton2_Click" ImageUrl="~/del.png" Style="text-align: right" Width="22px" ForeColor="#003366" />
                                </td>

                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                    <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                </asp:DataList>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:musicplayerConnectionString %>" SelectCommand="SELECT * FROM [musiclist] where music_name in(select music_name from favourite)" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                <br />


            </div>
        </asp:Panel>
        <div class="bottom">

            <div class="songInfo column">
                <image src="playing.gif" width="42px" height="24px" alt="" id="gif" />
                <span id="masterSN"></span>
            </div>
            
            <div class="slider_container row">
                <div class="current-time column">00:00</div>
                <input class="column" type="range" name="range" id="seek_slider" min="0" value="0" max="100" />
                <div class="total-duration column">00:00</div>
              </div>
                 <div class="column icons">
                <i class="fas fa-2x fa-step-backward" id="previous"></i>
                <i class="far fa-2x fa-play-circle" id="masterPlay"></i>
                <i class="fas fa-2x fa-step-forward" id="next"></i>
                
                <select id="speedlist" >
                <option value="0.50">0.50x</option>
                <option selected="selected" value="1.00">normal</option>
                <option value="1.25">1.25x</option>
                <option value="1.50">1.50x</option>
                <option value="2.00">2x</option>
                </select>
            </div>
           
            <div class="volume-slider-con"><div class="volume-slider"></div></div>
               
            
        </div>




    </form>
    <script src="https://kit.fontawesome.com/26504e4a1f.js" crossorigin="anonymous"></script>
    <script type="text/javascript">



        var tb = document.getElementsByClassName("songItemPlay");
        for (var i = 0; i < tb.length; i++) {
            var s = tb[i];
            s.setAttribute("id", i);

        }
        // Initialize the Variables
        let songIndex = 0;
        var x = document.getElementById("myaudio").src;
        var seekslider, seeking = false, seekto;
        let audioElement = new Audio(x);
        let masterPlay = document.getElementById("masterPlay");
        seekslider = document.getElementById("seek_slider");
        let volume_slider = document.querySelector(".volume_slider");
        let curr_time = document.querySelector(".current-time");
        let total_duration = document.querySelector(".total-duration");
        let updateTimer;
        let masterSongName = document.getElementById("masterSN");
        let songItems = Array.from(document.getElementsByClassName("songItem"));
        gif.style.opacity = 0;
        var e = document.querySelector('.volume-slider-con');
        var eInner = document.querySelector('.volume-slider');
        var drag = false;
        var speedlist = document.getElementById("speedlist");

        //let songs = new array()

        songItems.forEach((element, i) => {

            element.getElementsByClassName("songName")[songIndex].innerText = songs[i].songName;
        })

        //handle volume
        e.addEventListener('mousedown', function (ev) { drag = true; updateBar(ev.clientX); });
        document.addEventListener('mousemove', function (ev) { if (drag) { updateBar(ev.clientX); } });
        document.addEventListener('mouseup', function (ev) { drag = false; });
        var updateBar = function (x, vol) {
            var volume = e;
            var percentage;
            //if only volume have specificed
            //then direct update volume
            if (vol) {
                percentage = vol * 100;
            } else {
                var position = x - volume.offsetLeft;
                percentage = 100 * position / volume.clientWidth;
            }

            if (percentage > 100) {
                percentage = 100;
            }
            if (percentage < 0) {
                percentage = 0;
            }

            //update volume bar and audio volume
            eInner.style.width = percentage + '%';
            audioElement.volume = percentage / 100;
        };


        // Handle play/pause click
        masterPlay.addEventListener('click', () => {
            if (audioElement.paused || audioElement.currentTime <= 0) {
                audioElement.play();
                masterPlay.classList.remove('fa-play-circle');
                masterPlay.classList.add('fa-pause-circle');
                gif.style.opacity = 1;
            }
            else {
                audioElement.pause();
                masterPlay.classList.remove('fa-pause-circle');
                masterPlay.classList.add('fa-play-circle');
                gif.style.opacity = 0;
            }
            updateTimer = setInterval(seekUpdate, 1000);
        })
        // Update Seekbar

        seekslider.addEventListener("mousedown", function (event) { seeking = true; seek(event); });
        seekslider.addEventListener("mousemove", function (event) { seek(event); });
        seekslider.addEventListener("mouseup", function () { seeking = false; });
        function seek(event) {
            if (seeking) {
                seekslider.value = event.clientX - seekslider.offsetLeft;
                seekto = audioElement.duration * (seekslider.value / 100);
                audioElement.currentTime = seekto;
            }
        }
        let seekPosition = 0;
        function seekUpdate() {


            // Check if the current track duration is a legible number
            if (!isNaN(audioElement.duration)) {
                seekPosition = audioElement.currentTime * (100 / audioElement.duration);
                seek_slider.value = seekPosition;

                // Calculate the time left and the total duration
                let currentMinutes = Math.floor(audioElement.currentTime / 60);
                let currentSeconds = Math.floor(audioElement.currentTime - currentMinutes * 60);
                let durationMinutes = Math.floor(audioElement.duration / 60);
                let durationSeconds = Math.floor(audioElement.duration - durationMinutes * 60);

                // Add a zero to the single digit time values
                if (currentSeconds < 10) { currentSeconds = "0" + currentSeconds; }
                if (durationSeconds < 10) { durationSeconds = "0" + durationSeconds; }
                if (currentMinutes < 10) { currentMinutes = "0" + currentMinutes; }
                if (durationMinutes < 10) { durationMinutes = "0" + durationMinutes; }

                // Display the updated duration
                curr_time.textContent = currentMinutes + ":" + currentSeconds;
                total_duration.textContent = durationMinutes + ":" + durationSeconds;
            }
        }
        //  myProgressBar.addEventListener('change', () => {
        //    audioElement.currentTime = myProgressBar.value * audioElement.duration / 100;
        //})

        const makeAllPlays = () => {
            Array.from(document.getElementsByClassName('songItemPlay')).forEach((element) => {
                element.classList.remove('fa-pause-circle');
                element.classList.add('fa-play-circle');
            })
        }


        Array.from(document.getElementsByClassName('songItemPlay')).forEach((element) => {
            element.addEventListener('click', (e) => {
                makeAllPlays();

                songIndex = parseInt(e.target.id);
                e.target.classList.remove('fa-play-circle');
                e.target.classList.add('fa-pause-circle');
                audioElement.src = songs[songIndex].filePath;
                masterSongName.innerHTML = songs[songIndex].songName;
                audioElement.currentTime = 0;
                audioElement.play();
                gif.style.opacity = 1;
                masterPlay.classList.remove('fa-play-circle');
                masterPlay.classList.add('fa-pause-circle');
                updateTimer = setInterval(seekUpdate, 1000);
            })
        })

        document.getElementById('next').addEventListener('click', () => {
            if (songIndex >= songs.length) {
                songIndex = 0
            }
            else {
                songIndex += 1;

            }

            audioElement.src = songs[songIndex].filePath;
            masterSongName.innerHTML = songs[songIndex].songName;
            audioElement.currentTime = 0;

            audioElement.play();
            masterPlay.classList.remove('fa-play-circle');
            masterPlay.classList.add('fa-pause-circle');
            updateTimer = setInterval(seekUpdate, 1000);

        })

        document.getElementById('previous').addEventListener('click', () => {
            if (songIndex <= 0) {
                songIndex = 0
            }
            else {
                songIndex -= 1;
            }
            audioElement.src = songs[songIndex].filePath;
            masterSongName.innerHTML = songs[songIndex].songName;
            audioElement.currentTime = 0;

            audioElement.play();
            masterPlay.classList.remove('fa-play-circle');
            masterPlay.classList.add('fa-pause-circle');
            updateTimer = setInterval(seekUpdate, 1000);

        })
        speedlist.addEventListener("change", changespeed);
        function changespeed(event) {
            audioElement.playbackRate = event.target.value;
        }


    </script>

</body>

</html>
