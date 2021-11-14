;; Define a rule that says that a person is a “big shot” in a
;;  division if the person works in the division but does not
;;  have a supervisor who works in the division
(rule (bigshot ?person ?division)
      (and (job ?person (?division . ?rest-1))
           (or (not (supervisor ?person ?boss))
               (and (supervisor ?person ?boss)
                    (not (job ?boss (?division . ?rest-2)))))))
