--tables
local table_248k_diesel_train =
{
	{"Fuels", "Burn value", "Vehicle acceleration", "Top speed", "Equipment", "Effects"},
    {"[item=el_train_fuel_diesel_item]", "100MJ", "100%", "100%","[item=el_train_equipment_accelerator_item]", "acceleration: +35%"},
    {"[item=el_train_fuel_diesel_energized_item]", "135MJ", "55%", "130%", "[item=el_train_equipment_generator_item]", "power: +600kW"},
    {"[item=fi_fuel_train_crystal_item]", "350MJ", "60%", "155%", "[item=fi_train_equipment_generator_item]", "power: +2.4MW"},
}
local table_248k_star_engine =
{
    {"Products", "Amount/s out", "Protium/s usage"},
    {"Fusion Stage"},
    {"[item=iron-plate]", "1 000", "26 000"},
    {"[item=copper-plate]", "896", "26 000 "},
    {"[item=sulfur]", "1 000", "16 000"},
    {"[item=el_lithium_item]", "1 000", "3 000"},
    {"[item=uranium-238]", "282", "26 000"},
    {"[item=uranium-235]", "282", "26 000"},
    {"Exotic Stage"},
    {"[item=iron-gear-wheel]", "1 000", "26 000"},
    {"[item=steel-plate]", "1 000", "26 000"},
}
local table_248k_exotic_science =
{
    {"Satelites", "Result", "Amount"},
    {"[item=fu_space_probe_sputnik_item]", "[item=fu_space_probe_data_card_1_item]", "10"},
    {"[item=fu_space_probe_probe_item]", "[item=fu_space_probe_data_card_2_item]", "10"},
    {"[item=fu_space_probe_deep_probe_item]", "[item=fu_space_probe_ore_item]", "100"},
}
--Thread
local thread_248k = 
{
    name = {"248k mod " .. "[item=fu_star_engine_core_item]"},
    localized = false,
	specified_version = 0,
	topics =
	{
        {
            name  = {"gui.bk_248k_overview"},
            align = "center",
            topic =
            {	
                {type = "title", title = {"gui.bk_248k_about"}},
                {type = "text", text = {"gui.bk_248k_about_text"}},
                {type = "image", spritename = "bk_sprite_1"},
                {type = "image", spritename = "bk_sprite_2"},
                {type = "subtitle", subtitle = {"gui.bk_248k_first_steps"}, align = "center"},
                {type = "text", text = {"gui.bk_248k_first_steps_text"}}
            }
        },
        {
            name  = "KI1 core " .. "[item=el_ki_core_item]",
            localized = false,
            align = "center",
            topic =
            {	
                {type = "title", title = {"gui.bk_248k_ki1_core"}},
                {type = "text", text = {"gui.bk_248k_ki1_core_text"}},
                {type = "image", spritename = "bk_sprite_3"},
                {type = "text", text = {"gui.bk_248k_ki2_core_text"}},
                {type = "image", spritename = "bk_sprite_7"}
            }
        },
        {
            name  = "Diesel train " .. "[item=el_diesel_train_item]",
            localized = false,
            align = "center",
            topic =
            {	
                {type = "title", title = {"gui.bk_248k_diesel_train"}},
                {type = "text", text = {"gui.bk_248k_diesel_train_text"}},
                {type = "table", table = table_248k_diesel_train}
            }
        },
        {
            name  = "Fusion " .. "[item=fu_fusor_item]",
            localized = false,
            align = "center",
            topic =
            {	
                {type = "title", title = {"gui.bk_248k_fusion"}},
                {type = "text", text = {"gui.bk_248k_fusion_text"}},
                {type = "image", spritename = "bk_sprite_4"},
                {type = "text", text = {"gui.bk_248k_fusion_1_text"}},
                {type = "image", spritename = "bk_sprite_5"},
                {type = "text", text = {"gui.bk_248k_fusion_2_text"}},
            }
        },
        {
            name  = "Star engine " .. "[item=fu_star_engine_core_item]",
            localized = false,
            align = "center",
            topic =
            {	
                {type = "title", title = {"gui.bk_248k_star_engine"}},
                {type = "text", text = {"gui.bk_248k_star_engine_text"}},
                {type = "image", spritename = "bk_sprite_6"},
                {type = "text", text = {"gui.bk_248k_star_engine_1_text"}},
                {type = "table", table = table_248k_star_engine}
            }
        },
        {
            name  = "Exotic science " .. "[item=fu_space_probe_science_item]",
            localized = false,
            align = "center",
            topic =
            {	
                {type = "title", title = {"gui.bk_248k_exotic_science"}},
                {type = "text", text = {"gui.bk_248k_exotic_science_text"}},
                {type = "table", table = table_248k_exotic_science}
            }
        },
        {
            name  = "Blueprints " .. "[item=processing-unit]",
            localized = false,
            align = "center",
            topic =
            {	
                {type = "title", title = {"gui.bk_248k_blueprints"}},
                {type = "text", text = {"gui.bk_248k_blueprints_text"}},
                {type = "blueprint", text = "gui.bk_248k_blueprints_1", blueprint ="0eNq9mt1u6kYUhd/F1+Ro/sdGVd+g172oIgvCnNQqGGSb06YR794xpA4o3ll7o7Q3UQzmmzV7L3uWB16L9faYDl3TDsXytWie9m1fLH97LfrmuV1tx9eGl0MqlkUzpF2xKNrVbjxK2/rP1ZC6+jm1qVsN+64+n3BaFE27SX8VS316XBSpHZqhSRfk+eClbo+7deryCROszx9fPaeHYdX+kYc47Pv8oX07Dp5BD8Z/84viJf+ny28+j5BFtulpPKUfz9Hjny5trgdp8pE9PZ5Op8WHgc008KHJU5sZ0E0DhjzgDMK+I467wxzCvgHiWfGm6S6Cz6Nn/UO339br9PvqR7Pvxg89Nd3TsRnq/N5mIn1vun6oP7Ti+/aY5zdJODeiuNSlzzXMndRKqfF4d1idm5PP+rk48UunidK5adD1vtnmV2Zmbt6LdztzNwP0N714GPYPz93+2G7mwGoCfyhqmEEH2GZ9A5xBRIhQyCklrtjoan7FKqRpVPK5Jq0YopxElNZQlYGqDN8L+hMvmDm2ZcxYiWbs+GormXG1R8UsYS0Dnm8QTRdeCvCeqRmXgujeoeGlAK9Oo9hd1LImGs0mC71sDKyjlpTRWFBGC6uIlwUvUoQugAgVYf9XIkWR7xMtbGcJJnsFpGZb8dUZmY0tXiq0lVTSopVCexi++AuFjrJmWBTsxvvgpA1Xz6HJliiCWM+Myfrd0F6SkiMVk20Q5GRPqI8ChiMYJWQYyKgEYZBgOCVIgxQD56QKMuDzy5WrKIYVpEiK4QQMwh8ORh0N/eGgT6/uUBQjCvIrxYA+1dhjON1Dj3nFj48UQvMRRGc9dCk0mIcm9RDh+LGVQkCLQnd5fCeFiMjPuhSi5COopiJ7QoMHZE5YiaDZcZUiIGtCTwTkTGjM4NgRlyLwQzLRzYBsCZeigFyJ71ZBEH8pBHQlNFVEtsRLSBQEW6Ih0fARlAoUYMenxwlwG2D/j41Joz7uTP4k2Zm0noir0QmipiWq5wUMQzACe2/YcJ4hYrzedD90qe+PXfN36urLiZ/nUDOz/Zz/bw43m/hv1FS/vTUnoxSkTqo0kr1LglEqAYNoc4lTeIQ6DGqz9pI2l1bc5qvb2pe1uXSCAEqVRrB/SXUo8BGUCpiYKogoUY+jqMWVuMXu6ztcKX4YJepSaX6SJBpcGT6CUoGfYSHCoe0eSX8rL+2v/Q/aG9jRlCpKZAdLqrklm0BpQCsFXCe0UqC3laS3Wmlpc7X++u5qZfhBlayM5cdMSzEcn0HqQOuEdpgRPvtJAp2QpntcpMCS734VBSnvUveepEh11X1gh8BaCTbCqGlrfZ86BdWZu8ABci1/m4ictLvPiVCbv4erITawt1HIGcd7lHmo7K6LpoLYir/RQM346utiSS8s0mY0/2ZTUgzDZ1QUw/KvflKH4zNIHZ59PZIyAhtBqojcS4QUUXIJpAa+aykRVrERlAor8CflcWv4D+4kQ+BPkuHYj5Ykgm9PEhHYzz8kgm1PksDO6SSBb08KAb9W1bcrxuPi8lPU5dUvVxfFdrVO23+3HOvh2K2bNvW1U7/8mt/9kbr+krtL7aKrYog5OfpwOv0D44mh6A=="},
                {type = "blueprint", text = "gui.bk_248k_blueprints_2", blueprint ="0eNq9mNtq4zAQht9F13axZB3sPMnCUowTK6nAJ3woDcHvvnJS3GSrqUZZ2Kv4IH/6NZoZ/eRC9vWs+8G0E9ldiDl07Uh2vy9kNKe2rNdn07nXZEfMpBsSkbZs1rvjXOw7U+uhuD5fImLaSn+QHV1eI6LbyUxG30jXm3PRzs1eD3bAxtjr0k5nmX032uH20s5mETJ7ERE5k12sXsRKtjOM67ux17qKm66aax2nZMeWJfrGZ16+Yv/CTzd+b2xgvqun93QHgKMB0g0QG+BNl1MMUFKPDBlGAbQo32KEB5A9AOKpi09DN7eVAyXvURGpzKAPt/fSAc43cKMrMzexru3wwRzivqsdSlXiCRhN0FIVB6UyF5l6oqiETxtDE4B9oPi8FgABn9gcIARmNiQkMLUhNcrR7W5jXMn5yforMSNir03/CHk7V0N30m3RfZzXn88hd51IH48r4t3O5etHNHuQOQ/tTzJz36LzANpXIwVoLEGnJbCXDF8akAaGTssUIOBLgwEEHpaRkJDA+oDUSHRMISEKTYA03PX9uel/iGni/DxHbwl1C0iTsFgmAIaGYSA1DH8MsnuW9xhM08BzUHLfkjleKwe1us7BVKDdBBRHGeAuk2fcn3raVkDhzAIM61OSg52QLwN44iner/Knzu8ptnqBbeYsqOqgZaRBFEgLxyYtJEOE+4z0v9sMLsONeoJpUFw941+AY4Vnz9gXCJaHG/4E0+cE2hYBOSfQrgjIOYE2RUBsBNoTARZChFkiSEaYI4K0oA0RBED7IWgdGTacgMsVaEMEGG0Z5ocgCg33MQLTJWRYxweiJNNw6yIwFS3RhwAUOIHNIAiAzuFrbF5vp8BqOrb//yJSl3td22ej7vVQTt1QsF/F5kre9TDeIpBRrniupKKJFHJZ/gAIn33Q"},
                {type = "blueprint", text = "gui.bk_248k_blueprints_3", blueprint ="0eNqd3cuOHUd2RuF3qTG7kZlx1zt47IHRIEi5bBTAG8ii0YKgdzfJhqiCHSsy1h51S1B9EvfJPPFX3PbvD2/ffX389Pnpw/PDL78/PP368cOXh1/+4/eHL0///eHNu+9/7/m3T48Pvzw8PT++f3j18OHN++9/9ebXX7++//ruzfPHzw9/vHp4+vCfj/98+OX849XtTz6+e/3l47s3n1//+Nt//ez1xz9ePTx+eH56fnr813/Cj7/47fWHr+/fPn7+hk//5a8ePn388u1nPn74/m/85vztbK8efvv2vyP/8f0/5/8o165SVkraVdJKybvKuVLKpjJWSN1ElrVtm8iytH0TWVZ27FZ2hZzHnrJGNh/b5R/n3Hxql4U9Nx/a5Ud8bj6zy4ft3Hxk18/9Wf//d8q//pGJlP7+Z22+/b+p1oRWb7UutHGrbT7O17X85tt8nK+8VDaf56sulc0H+upLZfOJTsdS2Xyk07q6m890Wld383s4rau7+UWc1tXd/CbO6+puPrt5Wd20+ezmZXXT5rObl9VNm89uXlY3bT67ZVndlG0ouqZMsalozlQbi+ZMs7loznQZjObKkMloquRDRqO5cspsNFcuGY7mSnLhaI5kF47mSHHhaI5UF47mSHPhaI50GY7mio0MU6XYyDBXbGSYKzYyzBUbGeaKjQxzxUaGuWIjw1yxkWGu2MgwV2xkmCrVRoa5YiPDXLGRYa7YyDBXdGQ4poyODHNGR4Y5oyPDnLGRYa7YyDBVmo0Mc8VGhrliI8NckZFhjsjIMEdkZJgjMjLMERkZ5oiNDHNlhOZTjvmcRT9C8ymknaH5FNIuGY6m9epJhqO5kmU4mitFhqO5UmU4mitNhqO50mU4mitDhqOpMg4ZjubKKcPRXLlkOJorSYajuZJlOJorRYajuVJlOJorTYaj3qdMl+EImCHD0Zw5j0OmI3JOF4+IuVw+Iia5gERMdgmJmOIiEjFVZSRSmgpJpHSVkkgZKiaBsrsWt37ydhfjbt6DF8txIin1Bqs7LxbmRFRiLkeyEnPFhSWqWXVpiZjm4hIx3eUlYoYLTMDsrsyldYl3l+bSusS7a3NpXeLtxbl1iXdX5/JNiYuLTcRUl5uIaS44EdNdciJmuOgETDpsdqpz57ThCZzLpidwkk1P4Pz1JH/5+vbL85sfP8vhCZQiwxMwVYYnYJoMT8B0GZ6AGS48zZXdtbr1H2l3rW5d3921uvWH/WKtbvXkrR+83bW6m7cg2zgBTN36I/1ME6DYNAGMTRPA2DQxZ4pNE8DYNAGMTRPA2DQBjE0TwJStpy/fVNiGCWBsmADGhglgbJiYM1WHCdgjqMMEODpMgKPDBDhZTsUAY9MEMDZNAGPTBDA2TQAj08RcaTJNgCLTBCgyTYCS3FQMKDZOAFNCUzGZNgHX0FQMci00FYNcl9kJajbkVMyc6YcMT8CcMjwBc8nwBEyS4QmYLMMTMEWGJ2CqDE/ANBmegOlyKgaYIdPTnNld28vrEm8v7q1LvLu6V9YlHmJG+W8vvsdOOn+QjZfuvWJT0DV3qkxBwDSZgoDpMgUBM2QKuuanPQ6ZgoA5XQoC5XIpCJTkUhAo2aUgUIpLQaBUmYKAaaEUBK/ndfRQCkJuhFIQcbtLgT9T0Lxmu2uBP1MQMJdMQcAkmYKAyTIFAVNkCgKmyhQETJMpCJguUxAwQ6agObO75pfXJd5d88vrEl9iRTvfv/GXyB/5/o2/7EHpfswdeVSaGHlYmhh5XJoYeWCaGHlkGpjkzkyT4g5Nk+JOTZPijk2T4s5NkyIPThNT5QgKTJMjKDBdjqDADDmCzpnt1b9jzZxyBAXmkiMoMEmOoMBkOYICU+QICkyVIygwTY6gwPTQr9ytw5iXR+hXbvSK3QPa+tyRe0CJkXtAiZF7QImRe0CJkXtAiXF7QElxe0BJcXtASXF7QEGpbg8oKXIPKDGhPaD4etbQHlDmQntAmZObNqhmcg8oMXLXBjFy1wYxctcGME3u2iBG7togRu7aIEbu2iBG7togRu4BJUZu2yCmRX7lxle09civ3MyNWJwp4JnjgC/jDHqnjTN17lwyzgCTZJwBxqyz5PsiFVP0e84sjt9r5vm/17pLGFD/4RLGXNldUrx5NMcZShhUoXGFEgZyKZQwkMsyYUDNikwYwFSZMIARj/jV72skvuLT/Qs4xFd8un0D0yG+4VO75+Rp2flHkA55XJYYeV6WmBwa87FGJTTmI1ftmAp3tTU5pgLT5ZgKjPzdE26Ok797gmJ/9wRG3l9AjLzAgBh5gwExclaQGDkrSIycFSQmOCt4wSt6BmcFybv0rOD8krzLzgoCY2cFgUmhGI1FyqEYjVyJxGjUaiRGo9bclyXUv7svS1CG/LKcM+kIxWiqUDpDMRq5KxSjkUtyZICaZTkyAFPkyABMDcVorFELxWjkeihGIzdCMZq43eXMn6Pq/CPYXc7M6+dqdzkzr5+rnEIxGmuUQzEauRIa8+sgr4bGfPbsXXntmDvysjxi5G15wJQjMuZjkcoZGfOZuwJjPmspMOaz5vbDUv3dflhS5H5YYkL7YblCof2wzIX2wyJX5X5YqFmV+2GJkfthiUmRMZ9rlCNjPnMlMuYzVyNjPnPynA59BPKcDjHynA4w7YiM+VijdkbGfOYuOabWPneSuiOElOyGVGKKGhhIqebyCUKaGxeIkQcoiRnq8glQ7PlJYuREOTGXutKAFDlPTkyORegKr6dbCE33np0pr/P1gC5nyomRM+XEjFCEpiKNIxShkTsjERq1KxKhUXN7xKH+w+0RJ0XuEScm1F2LKxRqr8VcqL8Wc7Jbxrxm+ZDtMoiR/TKIuUIRGmqUjxSK0MjlUIRGroQiNHJVDqrwETQXoYnpclQFZoQiNNXoPEIRGrkzNuYn8q7YmI+evbmnznt+nvLmHmLkzT3E1NCYj0VqoTEfuR4Z81EbkTGftN2l03X9dxdO1w/D7rrpzaNp1k033hizbrrxQqt103HPyUNwVDN5CI4YeQiOmBEa86lGZu003b+AZu003b+BZu30xZiPXJJj/vwj2F07zevnanftNK+fK7N2mu/fQbN2mu/fwf17X//84oJehEOOqdCN8JBjKjCnGxlAudzIAEqSIwMwcnsuMXJ7LjFyey4xcp6cGDlPToycJwdGrYO+GHWhVVJ2C6Hp3tMz5cfcSfKVB8ZOlQNTQjEai1RDMRq5FonRqPVIjEbNbc+F+sujoaTI7bnEhI6GYoVeLIX+19Przx/ffnz96ePn550ojWToeChz8ngo1U0eDyVGHg8lpoeiNNZohKI0cWY5NN2/hWY59EWURu6SI+v8I9g9PprXz9X28dH1c2Wums3376C5ajbfv4Othcb90sjroXGfvSHH/dLn3bEPN+4Tc7pxn5grMu5jkXqKjPvM5cC4z1oJjPusue6pVH/XPpUU2T+VmFADVazQCHVQZS7UQpU5eQYJajbkGSRi5BkkYkpkzOca1ciYz1yLjPnM9ciYz5y8F3H+EZRD3otIjLwXkZjQvYhUo3KE7kVkzt6LWOrckfciEiPvRSTGnUEixZ1BIkWeQQLGXllLjNyiS4zcokuMnC8nRs6XEyPny4mpsRgNLRuKWxBN956dMS957sgZc2AuOWNOzBmK0VSk6wrFaORSJEajliMxGjW3R5fqX92XJShyky4xPRSjsUIjFKOJU8dJxz13ypFhXrPdq25/jgzAJDkyAJNDMRprVEIxGrkaitHItVCMRq7LURU+giFH1TmzfXx0/VzlMxSjqUb5CsVo5GLdUspJXqxbCnu2W0q55o7slkKM7JZCTA+N+VikERrziTPLqBvaGRnzUXNt3KD+xbVxI0W2cSMm1MaNKxRq48ZcqI0bc/IUEtVMtnEDpspjSMScoTGfamTWUNP9C2iOk6b7N1AdJ233nLz6iD4CefURMfLqI2J6aMzHGo3QmE9csxcflWPunOrAJiny3iNi3DEkUrI5sEmIPIVEjNykS0xTBzZJkXt0ibET5XPmxULozoFNUuw8OTBXKEJnuH64uIXQdO/ZmfI8Xw/ocqacGDlTTkyLRGguUo9EaOZGIEKjZlZD7/+ow23RhfoPt0WXFLlFl5gcidBcoRKJ0MzVSIRmrrlxgWrWXYQmZriBYc5Uc4PuXxGaalSPMxKhmbsiEZq5FInQzMkWAfQRyBYBxMgWAcSEWgRwjUItApiLtQjIcP1wPWMtAtizLQJynTuyRQAxskUAMaEWAVykUIsA5iItAliLtAhgzbUIoPq7FgGgXLJFADGhFgFYoSvUIoC5UIsA5uQZJKqZPINEjDyDREyoRQDXKNQigLlQiwDkUqhFAHPy5iP4CJJsEUCMvPqImFCLAK5RqEUAc/bio5znjrz4iBh58REx7gwSKNmdQSJFnkEiRm7PJUZuzyVGbs8lRs6TEyPnyYmR8+TExFoEZLh+uAYbh6KnG4fma+7IFgHEyKlyYkItArhIoRYBzEVaBLAWaRHAmtueS/V323NJkdtzgamhFgFYoRpqEcBcqEUAc7JFANVMtgggRrYIICbUIoBrFGoRwFyoRQBzoRYByDXZIgA+giZbBBAjWwQQE2oRwDUKtQhgLtYiIA3yYi0C2LMtAvIxd2SLAGJkiwBgto+OljVzumbhxFyuWTgxSTULJyWrZuGkFNUsnBR3MpQUdzKUFHkylJjQyVB8PWMnQ5kLnQxlzv7qOa+ZPRlKjP3VE5jimoUTU12zcGKaaxZOTHfNwokZrln4nGm7Jz9TXzN2VhAYOysIjJ0VBCY0K0ivaIs1DmXOzgqmPnfkrCAxclaQmOHiAjC7Zz//jAvEnC4uEHOpuEBKUnGBlKziAinuBBwp7gQcKfIEHDFygzgxcoM4MJfcIE7M6UZQYi43ghKT3AhKTHYjKDHFjaDEVDeCEiPvRSRG3otIjLwXEZgUuxcxwXXlLcXuRWTP3ouY6tyR9yISI+9FJKbIMRSYKsdQYJocQ4HpbgwFZbgxdK7sLjqu6ytvrCXFbYclRW6HJSa0HRZfzxzaDstcaDssc3I7LNVMboclRm6HBWZ34fFnYADmlIEBmEsGBmCSDAzAZBkYgCkyMAAju6UQI7ulECO7pRAT6paCr2gNdUthbvvXwT+/s/Pc2Y4dZe1sd0dJa8ce1CFHHtQhRh7UIabJGARMlzEImCFj0JzZXTe8UU4Xg0C5XAwCxZ2fJMW1cSNFHqAkJtTGLUHDhtZCbdyYC7VxY062cYOaddnGjRjZxo2YS8YgYJKMQcBkGYOAKTIGAVNlDAKmyRgEjLy6hxh5dQ8wQ17dQ8zucsq6xLuLgnld4t1FwbIu8cg2PV1zp9j0BE616Qkcu2+DnK5uNSBFbtuYM/2Q2zaIkds2iJHbNohx2zZIcds2SHHbNkhx2zZIaebyCULkrg1ibJyYM+ehLp8gxaYJYGyaAMamCWBsmgDGpglgbJoAxqYJYGyaAGaoa0JAuWyYAMaGCWBsmADGhglgdJg45o4OE+DoMAGODhPgyE2gxNg0MWeSTRPA2DQBjE0TwMg0AYpME6DINAGKTBOguE2gpNg4AUxsEyg0/Ok5tgkUudgmUOTkJlComT1/SIzcBEqM3ARKjNwESozcBEqM3ARKjNwECkyRm0CJkZtAiZGbQImRm0CJyTI9AVNkegKmyvQETJPp6epzp8v0RM6Q6Qmcao/NkiOPzRIjj80Sk1x6Iia79ERMcemJmKrSEylNpSdSukpPpLgLDUBp7kIDUuSFBsSEmqpe0Dqpm/OBf6Un5kINVZmTDVWpZrKhKjGyoSox3aUnYoZLT8DsLvKldYl3F/nSusS7i3xpXeLtRb51ibu8TI8YeZkeMfIyPWKaS0/EdJeeiBkuPQEzDpue6tw5bXoC57LpCZxk0xM4WaYnYIpMT8BUmZ6AaTI9AdNlegJmuPQ0Vcb24b+1crr0BIrrr0GK669BiuyvQYwNFMDYQAGMDRTA2EABjA0Uc+a0gQIYGyiAsYECGBsogLGBAhgbKICxgQIYGyiAsYECGBso5sylA0WeOzpQgKMDBTg6UIBjAwUwNlAAYwMFMDZQAGMDBTAyUMyVJAMFKDJQgCIDBSgyUIBiAwUwoYZdF7TgGynUsIu5UMMu5uR5bKqZPI8NTJbnsYmR57GJkeexiZHnsYmR57GJkeexiZHnsYmR57GJkeexiZHnsYHZXejL6xJvL/StS7y70FdelPgfrx6enh/ff/uRt+++Pn76/PTh+dsPvHvz9vHd981WP7508vFv//7tb/7P4+cvP5Crn7nl0Wo7j/q9Bfn/ApOxYa0="},


            }
        }
    },
}

--Function for call Booktorio remote interface
function registerThread_248k()
	if remote.interfaces["Booktorio"] then
		remote.call("Booktorio", "add_thread", thread_248k) 
	end
end

--Suggested events where register/add the new thread
--script.on_init(registerThread)
--script.on_configuration_changed(registerThread)
--{type = "blueprint", text = "Waterturbine setup - 40MW", blueprint= ""},
