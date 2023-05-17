CREATE (CS_start:room { id: "CS_start", desc: "front of cse"}),
 (CS_101:room { id: "CS_101", desc: "Conference_Hall"}),
 (CS_102:room { id: "CS_102", desc: "Programming_lab"}),
 (CS_103:room { id: "CS_103", desc: "Skill_enhancement_lab"}),
 (CS_104:room { id: "CS_104", desc: "Network_lab"}),
 (CS_105:room { id: "CS_105", desc: "Faculty_room"}),
 (CS_106:room { id: "CS_106", desc: "Power_room"}),
 (CS_J07:room { id: "CS_J07", desc: "_junction"}),
 (CS_108:room { id: "CS_108", desc: "Staff_room"}),
 (CS_109:room { id: "CS_109", desc: "Faculty_room"}),
 (CS_110:room { id: "CS_110", desc: "Faculty_room"}),
 (CS_111:room { id: "CS_111", desc: "Faculty_room"}),
 (CS_112:room { id: "CS_112", desc: "Faculty_room"}),
 (CS_J15:room { id: "CS_J15", desc: "_junction"}),
 (CS_115:room { id: "CS_115", desc: "classroom"}),
 (CS_116:room { id: "CS_116", desc: "classroom"}),
 (CS_117:room { id: "CS_117", desc: "Library"}),
 (CS_118:room { id: "CS_118", desc: "TBI"}),
 (CS_119:room { id: "CS_119", desc: "HOD_Room"}),
 (CS_201:room { id: "CS_201", desc: "Seminar hall"}),
 (CS_202:room { id: "CS_202", desc: "B.tech(classroom)"}),
 (CS_203:room { id: "CS_203", desc: "advanced networking lab"}),
 (CS_204:room { id: "CS_204", desc: "digital lab"}),
 (CS_205:room { id: "CS_205", desc: "lab3(—)"}),
 (CS_206:room { id: "CS_206", desc: "lab4(—)"}),
 (CS_2J7:room { id: "CS_2J7", desc: "_junction"}),
 (CS_208:room { id: "CS_208", desc: "Staff room"}),
 (CS_209:room { id: "CS_209", desc: "Faculty room"}),
 (CS_210:room { id: "CS_210", desc: "Faculty room"}),
 (CS_211:room { id: "CS_211", desc: "Faculty room"}),
 (CS_212:room { id: "CS_212", desc: "Faculty room"}),
 (CS_J25:room { id: "CS_J25", desc: "_junction"}),
 (CS_214:room { id: "CS_214", desc: "elective classroom"}),
 (CS_215:room { id: "CS_215", desc: "elective classroom"}),
 (CS_216:room { id: "CS_216", desc: "classroom (b.tech)"}),
 (CS_217:room { id: "CS_217", desc: "seminar hall"}),
 (CS_218:room { id: "CS_218", desc: "classroom (b.tech)"}),
 (CS_219:room { id: "CS_219", desc: "classroom(m.tech)"}),
 (CS_301_B:room { id: "CS_301_B", desc: "classroom(m.tech)"}),
 (CS_301_A:room { id: "CS_301_A", desc: "m.tech lab(1)"}),
 (CS_302:room { id: "CS_302", desc: "faculty room"}),
 (CS_303:room { id: "CS_303", desc: "research scholar"}),
 (CS_304:room { id: "CS_304", desc: "elective classroom"}),
 (CS_305_A:room { id: "CS_305_A", desc: "m.tech lab(2)"}),
 (CS_305_B:room { id: "CS_305_B", desc: "classroom(m.tech)"}),
 (CS_107:room { id: "CS_107", desc: "Toilet_(Gents)"}),
 (CS_113:room { id: "CS_113", desc: "Toilet_(ladies)"}),
 (CS_114:room { id: "CS_114", desc: "Toilet_(Disabled)"}),
 (CS_207:room { id: "CS_207", desc: "Toilet (Gents)"}),
 (CS_213:room { id: "CS_213", desc: "Toilet (ladies)"}),
 (CS_S07:stairs { id: "CS_S07", desc: "Stairs"}),
 (CS_S05:stairs { id: "CS_S05", desc: "Stairs"}),
 (CS_S17:stairs { id: "CS_S17", desc: "Stairs"}),
 (CS_S15:stairs { id: "CS_S15", desc: "Stairs"}),
 (CS_S01:stairs { id: "CS_S01", desc: "Stairs"}),
 (CS_S11:stairs { id: "CS_S11", desc: "Stairs"}),
 (gf_wp:water_purifier { id: "gf_wp", desc: "Water_Purifier"}),
 (CS_start)-[:neigh {dist: 8.361085817041396e-05}]->(CS_101),
 (CS_101)-[:neigh {dist: 7.601668237781719e-05}]->(CS_102),
 (CS_102)-[:neigh {dist: 9.35361747059688e-05}]->(CS_103),
 (CS_103)-[:neigh {dist: 0.00010437570293397241}]->(CS_104),
 (CS_104)-[:neigh {dist: 7.590612624154086e-05}]->(CS_105),
 (CS_105)-[:neigh {dist: 3.7650970767595054e-05}]->(CS_106),
 (CS_106)-[:neigh {dist: 4.6536970776536465e-05}]->(CS_J07),
 (CS_J07)-[:neigh {dist: 2.9167573014496564e-05}]->(CS_108),
 (CS_108)-[:neigh {dist: 2.5910713304975403e-05}]->(CS_109),
 (CS_109)-[:neigh {dist: 2.1234725710722602e-05}]->(CS_110),
 (CS_110)-[:neigh {dist: 2.1005354080198734e-05}]->(CS_111),
 (CS_111)-[:neigh {dist: 2.6145034346177223e-05}]->(CS_112),
 (CS_112)-[:neigh {dist: 0.0001226790723372523}]->(CS_J15),
 (CS_J15)-[:neigh {dist: 3.336953504066213e-05}]->(CS_115),
 (CS_115)-[:neigh {dist: 5.885578773453388e-05}]->(CS_116),
 (CS_116)-[:neigh {dist: 0.00011643563572268378}]->(CS_117),
 (CS_117)-[:neigh {dist: 0.00013418499452837854}]->(CS_118),
 (CS_118)-[:neigh {dist: 3.9202438560154055e-05}]->(CS_119),
 (CS_119)-[:neigh {dist: 0.00010531746911119494}]->(CS_start),
 (CS_201)-[:neigh {dist: 7.601668237781719e-05}]->(CS_202),
 (CS_202)-[:neigh {dist: 9.35361747059688e-05}]->(CS_203),
 (CS_203)-[:neigh {dist: 0.00010437570293397241}]->(CS_204),
 (CS_204)-[:neigh {dist: 7.590612624154086e-05}]->(CS_205),
 (CS_205)-[:neigh {dist: 3.7650970767595054e-05}]->(CS_206),
 (CS_206)-[:neigh {dist: 4.6536970776536465e-05}]->(CS_2J7),
 (CS_2J7)-[:neigh {dist: 2.9167573014496564e-05}]->(CS_208),
 (CS_208)-[:neigh {dist: 2.5910713304975403e-05}]->(CS_209),
 (CS_209)-[:neigh {dist: 2.1234725710722602e-05}]->(CS_210),
 (CS_210)-[:neigh {dist: 2.1005354080198734e-05}]->(CS_211),
 (CS_211)-[:neigh {dist: 2.6145034346177223e-05}]->(CS_212),
 (CS_212)-[:neigh {dist: 0.0001226790723372523}]->(CS_J25),
 (CS_J25)-[:neigh {dist: 6.581786957714108e-05}]->(CS_214),
 (CS_214)-[:neigh {dist: 8.919316980428345e-05}]->(CS_215),
 (CS_215)-[:neigh {dist: 5.885578773453388e-05}]->(CS_216),
 (CS_216)-[:neigh {dist: 0.00011643563572268378}]->(CS_217),
 (CS_217)-[:neigh {dist: 0.0001381586775830273}]->(CS_218),
 (CS_218)-[:neigh {dist: 3.9202438560154055e-05}]->(CS_219),
 (CS_219)-[:neigh {dist: 0.0002276040360389683}]->(CS_201),
 (CS_301_B)-[:neigh {dist: 4.906617548592219e-05}]->(CS_301_A),
 (CS_301_A)-[:neigh {dist: 8.356641071695907e-05}]->(CS_302),
 (CS_302)-[:neigh {dist: 8.946578778558233e-05}]->(CS_303),
 (CS_303)-[:neigh {dist: 0.0001343168512932915}]->(CS_304),
 (CS_304)-[:neigh {dist: 7.493949517178953e-05}]->(CS_305_A),
 (CS_305_A)-[:neigh {dist: 6.0732500606177375e-05}]->(CS_305_B),
 (CS_J07)-[:neigh {dist: 0.00010479013446350972}]->(CS_107),
 (CS_J15)-[:neigh {dist: 8.168656986521883e-05}]->(CS_113),
 (CS_J15)-[:neigh {dist: 6.581786957714108e-05}]->(CS_114),
 (CS_S07)-[:neigh {dist: 8.386267749190285e-05}]->(CS_J07),
 (CS_S07)-[:neigh {dist: 1.0000000035164742}]->(CS_2J7),
 (CS_S05)-[:neigh {dist: 5.297086584949408e-05}]->(CS_114),
 (CS_S05)-[:neigh {dist: 1.0000000041508696}]->(CS_213),
 (CS_213)-[:neigh {dist: 9.111388226458666e-05}]->(CS_S15),
 (CS_S17)-[:neigh {dist: 8.386267749190285e-05}]->(CS_2J7),
 (CS_S01)-[:neigh {dist: 0.00010367092786859458}]->(CS_101),
 (CS_S01)-[:neigh {dist: 1.0000000136430678}]->(CS_219),
 (CS_S11)-[:neigh {dist: 0.00016824165335498732}]->(CS_202),
 (CS_S11)-[:neigh {dist: 1.0000000094795363}]->(CS_302),
 (gf_wp)-[:neigh {dist: 2.4479647238066593e-05}]->(CS_J07),
 (ff_wp)-[:neigh {dist: 4.596039690818129e-05}]->(CS_2J7);