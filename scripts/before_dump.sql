ALTER TABLE ONLY public.formula_one_sessionentry
    DROP CONSTRAINT formula_one_sessione_fastest_lap_id_c1878ebe_fk_formula_o;
ALTER TABLE ONLY public.formula_one_lap
    DROP CONSTRAINT formula_one_lap_session_entry_id_45d272fb_fk_formula_o;
