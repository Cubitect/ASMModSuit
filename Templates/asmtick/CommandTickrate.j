.version 52 0 
.class public super asmtick/CommandTickrate 
.super net/minecraft/command/CommandBase 

.method public <init> : ()V 
    .code stack 1 locals 1 
L0:     aload_0 
L1:     invokespecial Method net/minecraft/command/CommandBase <init> ()V 
L4:     return 
L5:     
        .linenumbertable 
            L0 9 
        .end linenumbertable 
    .end code 
.end method 

.method public getCommandName : ()Ljava/lang/String; 
    .code stack 1 locals 1 
L0:     ldc 'tickrate' 
L2:     areturn 
L3:     
        .linenumbertable 
            L0 13 
        .end linenumbertable 
    .end code 
.end method 

.method public getRequiredPermissionLevel : ()I 
    .code stack 1 locals 1 
L0:     iconst_2 
L1:     ireturn 
L2:     
        .linenumbertable 
            L0 18 
        .end linenumbertable 
    .end code 
.end method 

.method public getCommandUsage : (Lnet/minecraft/command/ICommandSender;)Ljava/lang/String; 
    .code stack 1 locals 2 
L0:     ldc '/tickrate [rate] [client|server]' 
L2:     areturn 
L3:     
        .linenumbertable 
            L0 23 
        .end linenumbertable 
    .end code 
.end method 

.method public execute : (Lnet/minecraft/server/MinecraftServer;Lnet/minecraft/command/ICommandSender;[Ljava/lang/String;)V 
    .code stack 3 locals 4 
L0:     aload_0 
L1:     aload_2 
L2:     aload_3 
L3:     invokevirtual Method asmtick/CommandTickrate processCommand (Lnet/minecraft/command/ICommandSender;[Ljava/lang/String;)V 
L6:     return 
L7:     
        .linenumbertable 
            L0 28 
            L6 29 
        .end linenumbertable 
    .end code 
.end method 

.method public processCommand : (Lnet/minecraft/command/ICommandSender;[Ljava/lang/String;)V 
    .code stack 5 locals 5 
L0:     aload_2 
L1:     arraylength 
L2:     iconst_1 
L3:     if_icmpge L44 
L6:     aload_0 
L7:     aload_1 
L8:     new java/lang/StringBuilder 
L11:    dup 
L12:    invokespecial Method java/lang/StringBuilder <init> ()V 
L15:    ldc '\xa7eServer tickrate = ' 
L17:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L20:    getstatic Field asmtick/ASMTick tickrateServer F 
L23:    invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L26:    ldc '\n\xa7eClient tickrate = ' 
L28:    invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L31:    getstatic Field asmtick/ASMTick tickrateClient F 
L34:    invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L37:    invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L40:    invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L43:    return 

        .stack same 
L44:    aload_2 
L45:    iconst_0 
L46:    aaload 
L47:    ldc '--server-sleep-lock' 
L49:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L52:    ifne L66 
L55:    aload_2 
L56:    iconst_0 
L57:    aaload 
L58:    ldc '-l' 
L60:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L63:    ifeq L211 

        .stack same 
L66:    aload_2 
L67:    arraylength 
L68:    iconst_2 
L69:    if_icmplt L163 
L72:    aload_2 
L73:    iconst_1 
L74:    aaload 
L75:    ldc 'ON' 
L77:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L80:    ifne L94 
L83:    aload_2 
L84:    iconst_1 
L85:    aaload 
L86:    ldc 'on' 
L88:    invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L91:    ifeq L101 

        .stack same 
L94:    iconst_1 
L95:    putstatic Field asmtick/ASMTick sleepLock Z 
L98:    goto L163 

        .stack same 
L101:   aload_2 
L102:   iconst_1 
L103:   aaload 
L104:   ldc 'OFF' 
L106:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L109:   ifne L123 
L112:   aload_2 
L113:   iconst_1 
L114:   aaload 
L115:   ldc 'off' 
L117:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L120:   ifeq L136 

        .stack same 
L123:   iconst_0 
L124:   putstatic Field asmtick/ASMTick sleepLock Z 
L127:   ldc2_w 50L 
L130:   putstatic Field asmtick/ASMTick maxSleep J 
L133:   goto L163 
        .catch java/lang/NumberFormatException from L136 to L151 using L154 

        .stack same 
L136:   aload_2 
L137:   iconst_1 
L138:   aaload 
L139:   invokestatic Method java/lang/Long parseLong (Ljava/lang/String;)J 
L142:   lstore_3 
L143:   lload_3 
L144:   putstatic Field asmtick/ASMTick maxSleep J 
L147:   iconst_0 
L148:   putstatic Field asmtick/ASMTick sleepLock Z 
L151:   goto L163 

        .stack stack_1 Object java/lang/NumberFormatException 
L154:   astore_3 
L155:   aload_0 
L156:   aload_1 
L157:   ldc '\xa7cSleep lock must be ON, OFF or an integer value' 
L159:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L162:   return 

        .stack same 
L163:   getstatic Field asmtick/ASMTick sleepLock Z 
L166:   ifeq L179 
L169:   aload_0 
L170:   aload_1 
L171:   ldc 'Sleep lock: \xa7aON\xa77 (Pocessing no packets between ticks)' 
L173:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L176:   goto L210 

        .stack same 
L179:   aload_0 
L180:   aload_1 
L181:   new java/lang/StringBuilder 
L184:   dup 
L185:   invokespecial Method java/lang/StringBuilder <init> ()V 
L188:   ldc 'Sleep lock: \xa7cOFF\xa77 (Processing packets every ' 
L190:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L193:   getstatic Field asmtick/ASMTick maxSleep J 
L196:   invokevirtual Method java/lang/StringBuilder append (J)Ljava/lang/StringBuilder; 
L199:   ldc ' ms)' 
L201:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L204:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L207:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 

        .stack same 
L210:   return 

        .stack same 
L211:   aload_2 
L212:   iconst_0 
L213:   aaload 
L214:   invokestatic Method asmtick/CommandTickrate parseFloat (Ljava/lang/String;)F 
L217:   fstore_3 
L218:   fload_3 
L219:   fconst_0 
L220:   fcmpg 
L221:   ifge L232 
L224:   aload_0 
L225:   aload_1 
L226:   ldc '\xa7cTickrate should be a non-negative floating point number' 
L228:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L231:   return 

        .stack append Float 
L232:   aload_2 
L233:   arraylength 
L234:   iconst_2 
L235:   if_icmpge L273 
L238:   fload_3 
L239:   invokestatic Method asmtick/ASMTick setTickServer (F)V 
L242:   fload_3 
L243:   invokestatic Method asmtick/ASMTick setTickClient (F)V 
L246:   aload_0 
L247:   aload_1 
L248:   new java/lang/StringBuilder 
L251:   dup 
L252:   invokespecial Method java/lang/StringBuilder <init> ()V 
L255:   ldc 'Tickrate set to ' 
L257:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L260:   fload_3 
L261:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L264:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L267:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L270:   goto L449 

        .stack same 
L273:   aload_2 
L274:   iconst_1 
L275:   aaload 
L276:   ldc 'client' 
L278:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L281:   ifne L317 
L284:   aload_2 
L285:   iconst_1 
L286:   aaload 
L287:   ldc 'CLIENT' 
L289:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L292:   ifne L317 
L295:   aload_2 
L296:   iconst_1 
L297:   aaload 
L298:   ldc 'c' 
L300:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L303:   ifne L317 
L306:   aload_2 
L307:   iconst_1 
L308:   aaload 
L309:   ldc 'C' 
L311:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L314:   ifeq L348 

        .stack same 
L317:   fload_3 
L318:   invokestatic Method asmtick/ASMTick setTickClient (F)V 
L321:   aload_0 
L322:   aload_1 
L323:   new java/lang/StringBuilder 
L326:   dup 
L327:   invokespecial Method java/lang/StringBuilder <init> ()V 
L330:   ldc 'Client tickrate set to ' 
L332:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L335:   fload_3 
L336:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L339:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L342:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L345:   goto L449 

        .stack same 
L348:   aload_2 
L349:   iconst_1 
L350:   aaload 
L351:   ldc 'server' 
L353:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L356:   ifne L392 
L359:   aload_2 
L360:   iconst_1 
L361:   aaload 
L362:   ldc 'SERVER' 
L364:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L367:   ifne L392 
L370:   aload_2 
L371:   iconst_1 
L372:   aaload 
L373:   ldc 's' 
L375:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L378:   ifne L392 
L381:   aload_2 
L382:   iconst_1 
L383:   aaload 
L384:   ldc 'S' 
L386:   invokevirtual Method java/lang/String equals (Ljava/lang/Object;)Z 
L389:   ifeq L423 

        .stack same 
L392:   fload_3 
L393:   invokestatic Method asmtick/ASMTick setTickServer (F)V 
L396:   aload_0 
L397:   aload_1 
L398:   new java/lang/StringBuilder 
L401:   dup 
L402:   invokespecial Method java/lang/StringBuilder <init> ()V 
L405:   ldc 'Server tickrate set to ' 
L407:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L410:   fload_3 
L411:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L414:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L417:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
L420:   goto L449 

        .stack same 
L423:   aload_0 
L424:   aload_1 
L425:   new java/lang/StringBuilder 
L428:   dup 
L429:   invokespecial Method java/lang/StringBuilder <init> ()V 
L432:   ldc 'Invalid argument: ' 
L434:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L437:   aload_2 
L438:   iconst_1 
L439:   aaload 
L440:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L443:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L446:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 

        .stack same 
L449:   getstatic Field asmtick/ASMTick isRemoteServer Z 
L452:   ifeq L492 
L455:   aload_0 
L456:   aload_1 
L457:   new java/lang/StringBuilder 
L460:   dup 
L461:   invokespecial Method java/lang/StringBuilder <init> ()V 
L464:   ldc '\xa7eServer tickrate = ' 
L466:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L469:   getstatic Field asmtick/ASMTick tickrateServer F 
L472:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L475:   ldc '\n\xa7eClient tickrate = ' 
L477:   invokevirtual Method java/lang/StringBuilder append (Ljava/lang/String;)Ljava/lang/StringBuilder; 
L480:   getstatic Field asmtick/ASMTick tickrateClient F 
L483:   invokevirtual Method java/lang/StringBuilder append (F)Ljava/lang/StringBuilder; 
L486:   invokevirtual Method java/lang/StringBuilder toString ()Ljava/lang/String; 
L489:   invokevirtual Method asmtick/CommandTickrate notify (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 

        .stack chop 1 
L492:   return 
L493:   
        .linenumbertable 
            L0 33 
            L6 34 
            L43 36 
            L44 38 
            L66 39 
            L72 40 
            L94 41 
            L101 42 
            L123 43 
            L127 44 
            L136 46 
            L143 47 
            L147 48 
            L151 52 
            L154 49 
            L155 50 
            L162 51 
            L163 55 
            L169 56 
            L179 58 
            L210 60 
            L211 63 
            L218 64 
            L224 65 
            L231 66 
            L232 69 
            L238 70 
            L242 71 
            L246 72 
            L273 73 
            L317 74 
            L321 75 
            L348 76 
            L392 77 
            L396 78 
            L423 80 
            L449 83 
            L455 84 
            L492 88 
        .end linenumbertable 
    .end code 
.end method 

.method public notify : [r73] 
    .code stack 4 locals 3 
L0:     aload_1 
L1:     ifnull L14 
L4:     aload_1 
L5:     aload_0 
L6:     aload_2 
L7:     iconst_0 
L8:     anewarray java/lang/Object 
L11:    invokestatic Method asmtick/CommandTickrate notifyCommandListener (Lnet/minecraft/command/ICommandSender;Lnet/minecraft/command/ICommand;Ljava/lang/String;[Ljava/lang/Object;)V 

        .stack same 
L14:    return 
L15:    
        .linenumbertable 
            L0 92 
            L4 93 
            L14 94 
        .end linenumbertable 
    .end code 
.end method 

.method public static parseFloat : (Ljava/lang/String;)F 
    .code stack 2 locals 2 
        .catch java/lang/NumberFormatException from L0 to L5 using L6 
L0:     aload_0 
L1:     invokestatic Method java/lang/Double parseDouble (Ljava/lang/String;)D 
L4:     d2f 
L5:     freturn 

        .stack stack_1 Object java/lang/NumberFormatException 
L6:     astore_1 
L7:     ldc -1.0f 
L9:     freturn 
L10:    
        .linenumbertable 
            L0 99 
            L6 100 
            L7 101 
        .end linenumbertable 
    .end code 
.end method 
.sourcefile 'CommandTickrate.java' 
.const [r73] = Utf8 (Lnet/minecraft/command/ICommandSender;Ljava/lang/String;)V 
.end class 
