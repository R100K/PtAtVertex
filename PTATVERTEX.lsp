(princ (strcat "
			
				Author - Robert Stokłosa
				Available commands:
				PTATVERTEX - inserts a points at each vertex of the polyline
") )

(defun C:PTATVERTEX (/ vertexlst pp poly pt)

    (while
		(not
		(and (setq poly (entget (car (entsel "\nSelect polyline: "))))
        (eq (cdr (assoc 0 poly))"LWPOLYLINE")
      	))
 		(prompt "\nPlease select polyline!")
 	)

    (foreach pp poly
        (if (= (car pp) 10)
        (setq vertexlst (cons (cdr pp) vertexlst))
        )
    )

    (foreach pt vertexlst
        (command "_.POINT" pt)
    )
)