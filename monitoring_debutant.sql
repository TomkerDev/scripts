PROMPT === [1] Taille Totale SGA ===
SELECT SUM(value)/1024/1024 AS "SGA Totale (Mo)"
FROM v$sga;

PROMPT === [2] Détail par Composant SGA ===
SELECT component, ROUND(current_size/1024/1024, 2) AS "Taille (Mo)"
FROM v$sga_dynamic_components;

PROMPT === [3] PGA - Utilisation Globale ===
SELECT name, ROUND(value/1024/1024, 2) AS "Valeur (Mo)"
FROM v$pgastat
WHERE name IN (
  'aggregate PGA target parameter',
  'total PGA allocated',
  'total PGA inuse'
);

PROMPT === [4] Nombre de sessions connectées ===
SELECT COUNT(*) AS sessions_total FROM v$session WHERE username IS NOT NULL;

PROMPT === [5] Nombre de sessions actives ===
SELECT COUNT(*) AS sessions_actives FROM v$session WHERE status='ACTIVE';

PROMPT === [6] Liste des utilisateurs actifs actuellement ===
SELECT sid, serial#, username, status, machine
FROM v$session
WHERE status='ACTIVE' AND username IS NOT NULL;

PROMPT === [7] Requêtes les plus gourmandes en mémoire (PGA) ===
SELECT sql_id, operation_type, ROUND(estimated_optimal_size/1024, 2) AS optimal_Ko
FROM v$sql_workarea
WHERE estimated_optimal_size IS NOT NULL
ORDER BY estimated_optimal_size DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT === [8] Requêtes en cours d’exécution ===
SELECT s.sid, s.username, q.sql_text
FROM v$session s
JOIN v$sql q ON s.sql_id = q.sql_id
WHERE s.status = 'ACTIVE';

PROMPT === [9] Événements d’attente (WAIT EVENTS) les plus fréquents ===
SELECT event, COUNT(*) AS occurences
FROM v$session
WHERE state='WAITING'
GROUP BY event
ORDER BY occurences DESC
FETCH FIRST 5 ROWS ONLY;

PROMPT === [ FIN DU MONITORING ] ===
