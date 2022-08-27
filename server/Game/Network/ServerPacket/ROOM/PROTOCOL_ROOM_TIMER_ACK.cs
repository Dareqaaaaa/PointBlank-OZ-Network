﻿/*
 * C# Server Emulator Project Blackout / PointBlank
 * Authors: the__all
 * Copyright (C) 2015 | OZ-Network
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Game.Network.ServerPacket
{
    class PROTOCOL_ROOM_TIMER_ACK : SendPacket
    {
        public override void WriteImpl()
        {
            WriteH(0xD0C);
            WriteC(5);
        }
    }
}
