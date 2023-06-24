CREATE (EC1_T01:room { id: "EC1_T01", desc: "Toilet"}),
 (EC1_101:room { id: "EC1_101", desc: "Instrumentation & Measurements Lab"}),
 (EC1_102:room { id: "EC1_102", desc: "Kinetic Circuits Lab"}),
 (EC1_J07:junction { id: "EC1_J07", desc: "_junction_top"}),
 (EC1_103:room { id: "EC1_103", desc: "Power Electronics Research Lab"}),
 (EC1_J06:junction { id: "EC1_J06", desc: "_junction"}),
 (EC1_105:room { id: "EC1_105", desc: "Faculty Room"}),
 (EC1_J05:junction { id: "EC1_J05", desc: "_junction"}),
 (EC1_109:room { id: "EC1_109", desc: "Communication Lab"}),
 (EC1_110:room { id: "EC1_110", desc: "Equipment Store I"}),
 (EC1_J04:junction { id: "EC1_J04", desc: "_junction"}),
 (EC1_111:room { id: "EC1_111", desc: "Component Store"}),
 (EC1_112:room { id: "EC1_112", desc: "Self Maintenance Lab"}),
 (EC1_113:room { id: "EC1_113", desc: "Biomedical Engineering Lab"}),
 (EC1_J03:junction { id: "EC1_J03", desc: "_junction_center"}),
 (EC1_114:room { id: "EC1_114", desc: "PG Seminar Hall I"}),
 (EC1_115:room { id: "EC1_115", desc: "PG Lecture Hall"}),
 (EC1_116:room { id: "EC1_116", desc: "Technical Staff Room I"}),
 (EC1_J02:junction { id: "EC1_J02", desc: "_junction"}),
 (EC1_117:room { id: "EC1_117", desc: "Equipment Store II"}),
 (EC1_118:room { id: "EC1_118", desc: "Dept. Library"}),
 (EC1_J01:junction { id: "EC1_J01", desc: "_junction_bottom"}),
 (EC1_119:room { id: "EC1_119", desc: "Faculty Room"}),
 (EC1_120:room { id: "EC1_120", desc: "Electronics Workshop"}),
 (EC1_121:room { id: "EC1_121", desc: "PG Lecture Hall"}),
 (EC1_104:room { id: "EC1_104", desc: "Power Electronics Lab"}),
 (EC1_106:room { id: "EC1_106", desc: "Faculty Room"}),
 (EC1_107:room { id: "EC1_107", desc: "Advanced Process Control Lab"}),
 (EC1_108:room { id: "EC1_108", desc: "Process Contol Lab"}),
 (EC1_S0N:stairs { id: "EC1_S0N", desc: "stairs"}),
 (EC1_S0C:stairs { id: "EC1_S0C", desc: "stairs"}),
 (EC1_T11:room { id: "EC1_T11", desc: "Toilet"}),
 (EC1_201:room { id: "EC1_201", desc: "Control System Lab"}),
 (EC1_202:room { id: "EC1_202", desc: "Lecture Hall-S1S2(AEI)"}),
 (EC1_203:room { id: "EC1_203", desc: "Computer Vision Lab"}),
 (EC1_J17:junction { id: "EC1_J17", desc: "_junction_top"}),
 (EC1_204:room { id: "EC1_204", desc: "Lecture Hall-S1S2(EC)"}),
 (EC1_209:room { id: "EC1_209", desc: "Seminar Hall"}),
 (EC1_J15:junction { id: "EC1_J15", desc: "_junction"}),
 (EC1_210:room { id: "EC1_210", desc: "Faculty Room"}),
 (EC1_J14:junction { id: "EC1_J14", desc: "_junction"}),
 (EC1_211:room { id: "EC1_211", desc: "Documentation Lab"}),
 (EC1_212:room { id: "EC1_212", desc: "Fiber Optics Lab"}),
 (EC1_J13:junction { id: "EC1_J13", desc: "_junction_center"}),
 (EC1_214:room { id: "EC1_214", desc: "VLSI Lab"}),
 (EC1_215:room { id: "EC1_215", desc: "Conference Room"}),
 (EC1_J12:junction { id: "EC1_J12", desc: "_junction"}),
 (EC1_216:room { id: "EC1_216", desc: "PG Seminar Hall II"}),
 (EC1_217:room { id: "EC1_217", desc: "Advandced Communication Lab"}),
 (EC1_J11:junction { id: "EC1_J11", desc: "_junction_bottom"}),
 (EC1_219:room { id: "EC1_219", desc: "DSP Lab (PG)"}),
 (EC1_220:room { id: "EC1_220", desc: "Faculty Room"}),
 (EC1_221:room { id: "EC1_221", desc: "Technical Staff Room II"}),
 (EC1_200:room { id: "EC1_200", desc: "HOD Room"}),
 (EC1_205:room { id: "EC1_205", desc: "Microwave Lab"}),
 (EC1_206:room { id: "EC1_206", desc: "Faculty Room"}),
 (EC1_207:room { id: "EC1_207", desc: "Faculty Room"}),
 (EC1_208:room { id: "EC1_208", desc: "Embedded System Lab"}),
 (EC1_213:room { id: "EC1_213", desc: "Network Operation Centre"}),
 (EC1_218:room { id: "EC1_218", desc: "DSP Lab (UG)"}),
 (EC1_S1N:stairs { id: "EC1_S1N", desc: "stairs"}),
 (EC1_S1C:stairs { id: "EC1_S1C", desc: "stairs"}),
 (EC1_T01)-[:neigh {dist: 7.686344384673694e-05}]->(EC1_101),
 (EC1_101)-[:neigh {dist: 0.00010810688090239893}]->(EC1_102),
 (EC1_102)-[:neigh {dist: 9.672315390770117e-05}]->(EC1_J07),
 (EC1_J07)-[:neigh {dist: 8.121146347692985e-05}]->(EC1_103),
 (EC1_103)-[:neigh {dist: 7.11599733022533e-05}]->(EC1_J06),
 (EC1_J06)-[:neigh {dist: 9.633169779254942e-05}]->(EC1_105),
 (EC1_105)-[:neigh {dist: 7.986379655448343e-05}]->(EC1_J05),
 (EC1_J05)-[:neigh {dist: 7.750529530460442e-05}]->(EC1_109),
 (EC1_109)-[:neigh {dist: 8.98507785102104e-05}]->(EC1_110),
 (EC1_110)-[:neigh {dist: 6.539309137558908e-05}]->(EC1_J04),
 (EC1_J04)-[:neigh {dist: 7.713432051012019e-05}]->(EC1_111),
 (EC1_111)-[:neigh {dist: 2.7807394699089022e-05}]->(EC1_112),
 (EC1_112)-[:neigh {dist: 6.780323959939165e-05}]->(EC1_113),
 (EC1_113)-[:neigh {dist: 8.194783524280433e-05}]->(EC1_J03),
 (EC1_J03)-[:neigh {dist: 9.46257961668372e-05}]->(EC1_114),
 (EC1_114)-[:neigh {dist: 7.45075627032252e-05}]->(EC1_115),
 (EC1_115)-[:neigh {dist: 5.822072225558959e-05}]->(EC1_116),
 (EC1_116)-[:neigh {dist: 8.446668277456645e-05}]->(EC1_J02),
 (EC1_J02)-[:neigh {dist: 8.679537775652633e-05}]->(EC1_117),
 (EC1_117)-[:neigh {dist: 8.742642621110468e-05}]->(EC1_118),
 (EC1_118)-[:neigh {dist: 7.737829412278496e-05}]->(EC1_J01),
 (EC1_J01)-[:neigh {dist: 5.457366489006175e-05}]->(EC1_119),
 (EC1_119)-[:neigh {dist: 7.475853396406915e-05}]->(EC1_120),
 (EC1_120)-[:neigh {dist: 6.807980683924099e-05}]->(EC1_121),
 (EC1_104)-[:neigh {dist: 0.00010603820301897997}]->(EC1_J06),
 (EC1_106)-[:neigh {dist: 8.577231780024615e-05}]->(EC1_107),
 (EC1_107)-[:neigh {dist: 7.78748849182873e-05}]->(EC1_108),
 (EC1_106)-[:neigh {dist: 3.57966506796335e-05}]->(EC1_J05),
 (EC1_S0N)-[:neigh {dist: 3.444647006837991e-05}]->(EC1_J07),
 (EC1_S0C)-[:neigh {dist: 3.2739120321577625e-05}]->(EC1_J03),
 (EC1_T11)-[:neigh {dist: 7.291375521805857e-05}]->(EC1_201),
 (EC1_201)-[:neigh {dist: 7.544484938396729e-05}]->(EC1_202),
 (EC1_202)-[:neigh {dist: 6.618462661688283e-05}]->(EC1_203),
 (EC1_203)-[:neigh {dist: 8.182581133650087e-05}]->(EC1_J17),
 (EC1_J17)-[:neigh {dist: 9.315479161104045e-05}]->(EC1_204),
 (EC1_204)-[:neigh {dist: 0.00023140001490915595}]->(EC1_209),
 (EC1_209)-[:neigh {dist: 6.935762178104579e-05}]->(EC1_J15),
 (EC1_J15)-[:neigh {dist: 0.000169190156038847}]->(EC1_210),
 (EC1_210)-[:neigh {dist: 6.841102908682117e-05}]->(EC1_J14),
 (EC1_J14)-[:neigh {dist: 7.379830349723682e-05}]->(EC1_211),
 (EC1_211)-[:neigh {dist: 5.7839033533411385e-05}]->(EC1_212),
 (EC1_212)-[:neigh {dist: 7.134525772774727e-05}]->(EC1_J13),
 (EC1_J13)-[:neigh {dist: 0.0001085284524948081}]->(EC1_214),
 (EC1_214)-[:neigh {dist: 6.236526998291198e-05}]->(EC1_215),
 (EC1_215)-[:neigh {dist: 6.704664122568778e-05}]->(EC1_J12),
 (EC1_J12)-[:neigh {dist: 9.787675617940643e-05}]->(EC1_216),
 (EC1_216)-[:neigh {dist: 6.403326166638829e-05}]->(EC1_217),
 (EC1_217)-[:neigh {dist: 8.255182615167855e-05}]->(EC1_J11),
 (EC1_J11)-[:neigh {dist: 7.151698609302504e-05}]->(EC1_219),
 (EC1_219)-[:neigh {dist: 8.329878810566761e-05}]->(EC1_220),
 (EC1_200)-[:neigh {dist: 8.076201581920112e-05}]->(EC1_J12),
 (EC1_206)-[:neigh {dist: 6.163978585188156e-05}]->(EC1_207),
 (EC1_207)-[:neigh {dist: 9.999977750304982}]->(EC1_208),
 (EC1_206)-[:neigh {dist: 6.548923652661849e-05}]->(EC1_J15),
 (EC1_213)-[:neigh {dist: 6.876795838703613e-05}]->(EC1_J13),
 (EC1_J11)-[:neigh {dist: 8.6968148766644e-05}]->(EC1_218),
 (EC1_205)-[:neigh {dist: 6.585134775032848e-05}]->(EC1_204),
 (EC1_S1N)-[:neigh {dist: 3.444647006837991e-05}]->(EC1_J17),
 (EC1_S1C)-[:neigh {dist: 3.2739120321577625e-05}]->(EC1_J13),
 (EC1_S0N)-[:neigh {dist: 1.0}]->(EC1_S1N),
 (EC1_S0C)-[:neigh {dist: 1.0}]->(EC1_S1C);