-- old: 2.3.25 b326983d4d647ba3599d17369df881c89b1540f2
-- new: 2.3.26 a4e6ce0964557df9224a311d2d007083e704983c

select pg_catalog.setval('public.trip_statuses_id_seq', 27, true);
UPDATE trip_statuses set status='charged', description='the charge has been sent to the billing company (but not necessarily coded or verified)', updated_at=now() where id=12;
UPDATE trip_statuses set status='claimed', description='the claim has been sent to a carrier or individual', updated_at=now() where id=13;
UPDATE trip_statuses set status='payment', description='a payment has been made on the claim', updated_at=now() where id=16;
UPDATE trip_statuses set status='zero balance', description='the claim has been fully collected', updated_at=now() where id=17;
INSERT INTO trip_statuses (id, status, description, updated_at) VALUES (27, 'adjustment', 'the claim has been adjusted', now());
UPDATE public.configuration_variables SET configuration_value='a4e6ce0964557df9224a311d2d007083e704983c', updated_at=now() WHERE configuration_key='data-model-commit-id';
