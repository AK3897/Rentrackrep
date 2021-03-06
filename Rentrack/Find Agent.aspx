﻿<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderandFooter.master" AutoEventWireup="true" CodeFile="Find Agent.aspx.cs" Inherits="Find_Agent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(document).ready(function () {
            if ( window.history.replaceState ) {
                window.history.replaceState( null, null, window.location.href );
            }
            
        });
    </script>
    <style>
        #bigdiv{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #search-div{
            width: 100%;
            height: 500px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            background-color: #677893; /*Steel Blue*/
        }
        .dropdowndesign{
            width: 30%;
        }
        #description{
            width: 70%;
            color: white;
            font-size: 22px;
            font-weight: 300;
        }
        #selecttxt{
            color: #f2934f; /*Orange-ish*/
            font-family: Georgia;
            font-size: 25px
        }
        .search-btn{
            padding: 15px 30px;
            font-size: 20px;
            font-weight: 300;
        }
            .search-btn:hover{
                transition-duration: 0.6s;
            }
        .card{
            box-shadow: 0px 0px 10px #AAA;
            width: 300px;
        }
            .card:hover{
                transform: scale(1.05);
                transition-duration: 0.6s;
            }
        #agent-list{
            display: grid;
            grid-template-rows: 1fr 1fr;
            grid-template-columns: 1fr 1fr 1fr;
            width: 80%;
        }
        .city{
            text-transform: uppercase;
            font-size: 14px;
            font-weight: bold;
            line-height: 10px;
        }
        .agent-name{           
            color: #677893; /*Steel Blue*/
            font-weight: 400;
            text-align: center;
        }
        .gotoproppage{
            background-color: #f2934f; /*Orange-ish*/
            color: white;
        }
            .gotoproppage:hover{
                background-color: #fEBA7F; /*Orange-ish*/
                color: white;
                transition-duration: 0.6s;
            }
        .agent-card{
            margin: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="bigdiv">
        <div id="search-div">
            <p id="description">Whether you're buying or selling, renting or relocating, our comprehensive directory of real estate agents will help you to find that perfect agent to fit your individual needs.</p>     
            <br /><p id="selecttxt">Select a city to find agents in</p>
            
            <!--City Dropdown-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorddcity" runat="server" ErrorMessage="This field is required" CssClass="text-danger error-design" ControlToValidate="cityddl" InitialValue="0" validationgroup="Addareafields"></asp:RequiredFieldValidator>
            <asp:DropDownList ID="cityddl" runat="server" class="dropdowndesign narrower form-control"></asp:DropDownList>

            <br />
            <asp:Button ID="Searchbtn" runat="server" Text="Search" class="btn btn-dark search-btn" OnClick="Searchbtn_Click"/>
        </div>
         
        <div id="agent-list">
                    
            <asp:Repeater ID="rptragent" Runat="Server">
                <ItemTemplate>
                    <div class="card agent-card">
                      <div class="card-body">
                        <h5 class="card-title agent-name"><%# Eval ("f_name") %> <%# Eval ("l_name") %></h5>
                          <hr />
                        <p class="card-text ">
                            <p class="agency-name"><%# Eval ("agency_name") %></p>
                            <p class="city"><%# Eval ("city_name") %></p>
                        </p>
                        <div style="text-align: center">
                            <a href="AgentProfile.aspx?id=<%# Eval ("agent_id") %>" class="btn gotoproppage">View Profile</a>
                        </div>
                      </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            
        </div>
    </div>
</asp:Content>

