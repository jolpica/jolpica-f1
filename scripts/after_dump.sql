ALTER TABLE ONLY public.formula_one_sessionentry
    ADD CONSTRAINT formula_one_sessione_fastest_lap_id_c1878ebe_fk_formula_o FOREIGN KEY (fastest_lap_id) REFERENCES public.formula_one_lap(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY public.formula_one_lap
    ADD CONSTRAINT formula_one_lap_session_entry_id_45d272fb_fk_formula_o FOREIGN KEY (session_entry_id) REFERENCES public.formula_one_sessionentry(id) DEFERRABLE INITIALLY DEFERRED;
